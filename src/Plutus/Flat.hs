{-# LANGUAGE FlexibleInstances #-}
{-# LANGUAGE FlexibleContexts #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DerivingVia #-}

module Plutus.Flat where

-- As: plutus-core/src/Language/PlutusCore/CBOR.hs

import qualified Language.PlutusTx.Coordination.Contracts.Game as Plutus
import qualified Ledger.Scripts as Plutus
import Language.PlutusCore.Core
import Language.PlutusCore
import Flat
import Flat.Encoder
import Flat.Decoder
import Data.Proxy

encodeConstructorTag :: Word -> Encoding
encodeConstructorTag = eWord

decodeConstructorTag :: Get Word
decodeConstructorTag = dWord

instance Flat (Some (TypeIn DefaultUni)) where
  encode (Some (TypeIn uni)) = encodeConstructorTag . fromIntegral $ tagOf uni

  decode = go . uniAt . fromIntegral =<< decodeConstructorTag where
    go Nothing = fail "Failed to decode a universe"
    go (Just uni) = pure uni

  size (Some (TypeIn _)) acc = 6 + acc

instance Flat (Some (ValueOf DefaultUni)) where
  encode (Some (ValueOf uni x)) = encode (Some $ TypeIn uni)
                                  <> bring (Proxy @Flat) uni (encode x)

  decode = go =<< decode where
    go (Some (TypeIn uni)) = Some . ValueOf uni <$> bring (Proxy @Flat) uni decode

  size (Some (ValueOf uni x)) acc = size (Some $ TypeIn uni) acc
                                    + bring (Proxy @Flat) uni (size x 0)

instance Flat StaticBuiltinName where
    encode = encodeConstructorTag . \case
              AddInteger           -> 0
              SubtractInteger      -> 1
              MultiplyInteger      -> 2
              DivideInteger        -> 3
              RemainderInteger     -> 4
              LessThanInteger      -> 5
              LessThanEqInteger    -> 6
              GreaterThanInteger   -> 7
              GreaterThanEqInteger -> 8
              EqInteger            -> 9
              Concatenate          -> 10
              TakeByteString       -> 11
              DropByteString       -> 12
              SHA2                 -> 13
              SHA3                 -> 14
              VerifySignature      -> 15
              EqByteString         -> 16
              QuotientInteger      -> 17
              ModInteger           -> 18
              LtByteString         -> 19
              GtByteString         -> 20
              IfThenElse           -> 21

    decode = go =<< decodeConstructorTag
        where go 0  = pure AddInteger
              go 1  = pure SubtractInteger
              go 2  = pure MultiplyInteger
              go 3  = pure DivideInteger
              go 4  = pure RemainderInteger
              go 5  = pure LessThanInteger
              go 6  = pure LessThanEqInteger
              go 7  = pure GreaterThanInteger
              go 8  = pure GreaterThanEqInteger
              go 9  = pure EqInteger
              go 10 = pure Concatenate
              go 11 = pure TakeByteString
              go 12 = pure DropByteString
              go 13 = pure SHA2
              go 14 = pure SHA3
              go 15 = pure VerifySignature
              go 16 = pure EqByteString
              go 17 = pure QuotientInteger
              go 18 = pure ModInteger
              go 19 = pure LtByteString
              go 20 = pure GtByteString
              go 21 = pure IfThenElse
              go _  = fail "Failed to decode BuiltinName"

instance Flat Unique where
    encode (Unique i) = eInt i
    decode = Unique <$> dInt
    size (Unique i) = sInt i

instance Flat Name where
    -- TODO: should we encode the name or not?
    encode (Name txt u) = encode txt <> encode u
    decode = Name <$> decode <*> decode

instance Flat TyName where
    encode (TyName n) = encode n
    decode = TyName <$> decode

instance Flat ann => Flat (Version ann) where
    encode (Version ann n n' n'') = encode ann <> encode n <> encode n' <> encode n''
    decode = Version <$> decode <*> decode <*> decode <*> decode

instance Flat ann => Flat (Kind ann) where
    encode = \case
        Type ann           -> encodeConstructorTag 0 <> encode ann
        KindArrow ann k k' -> encodeConstructorTag 1 <> encode ann <> encode k  <> encode k'

    decode = go =<< decodeConstructorTag
        where go 0 = Type      <$> decode
              go 1 = KindArrow <$> decode <*> decode <*> decode
              go _ = fail "Failed to decode Kind ()"

instance (Flat ann, Flat tyname) => Flat (Type tyname DefaultUni ann) where
    encode = \case
        TyVar     ann tn      -> encodeConstructorTag 0 <> encode ann <> encode tn
        TyFun     ann t t'    -> encodeConstructorTag 1 <> encode ann <> encode t   <> encode t'
        TyIFix    ann pat arg -> encodeConstructorTag 2 <> encode ann <> encode pat <> encode arg
        TyForall  ann tn k t  -> encodeConstructorTag 3 <> encode ann <> encode tn  <> encode k <> encode t
        TyBuiltin ann con     -> encodeConstructorTag 4 <> encode ann <> encode con
        TyLam     ann n k t   -> encodeConstructorTag 5 <> encode ann <> encode n   <> encode k <> encode t
        TyApp     ann t t'    -> encodeConstructorTag 6 <> encode ann <> encode t   <> encode t'

    decode = go =<< decodeConstructorTag
        where go 0 = TyVar     <$> decode <*> decode
              go 1 = TyFun     <$> decode <*> decode <*> decode
              go 2 = TyIFix    <$> decode <*> decode <*> decode
              go 3 = TyForall  <$> decode <*> decode <*> decode <*> decode
              go 4 = TyBuiltin <$> decode <*> decode
              go 5 = TyLam     <$> decode <*> decode <*> decode <*> decode
              go 6 = TyApp     <$> decode <*> decode <*> decode
              go _ = fail "Failed to decode Type TyName ()"

instance Flat DynamicBuiltinName where
    encode (DynamicBuiltinName name) = encode name
    decode = DynamicBuiltinName <$> decode

instance Flat BuiltinName where
    encode (StaticBuiltinName bn) = encodeConstructorTag 0 <> encode bn
    encode (DynBuiltinName   dbn) = encodeConstructorTag 1 <> encode dbn

    decode = go =<< decodeConstructorTag
        where go 0 = StaticBuiltinName <$> decode
              go 1 = DynBuiltinName    <$> decode
              go _ = fail "Failed to decode Builtin ()"

instance ( Flat ann
         , Flat tyname
         , Flat name
         ) => Flat (Term tyname name DefaultUni ann) where
    encode = \case
        Var      ann n         -> encodeConstructorTag 0 <> encode ann <> encode n
        TyAbs    ann tn k t    -> encodeConstructorTag 1 <> encode ann <> encode tn  <> encode k   <> encode t
        LamAbs   ann n ty t    -> encodeConstructorTag 2 <> encode ann <> encode n   <> encode ty  <> encode t
        Apply    ann t t'      -> encodeConstructorTag 3 <> encode ann <> encode t   <> encode t'
        Constant ann c         -> encodeConstructorTag 4 <> encode ann <> encode c
        TyInst   ann t ty      -> encodeConstructorTag 5 <> encode ann <> encode t   <> encode ty
        Unwrap   ann t         -> encodeConstructorTag 6 <> encode ann <> encode t
        IWrap    ann pat arg t -> encodeConstructorTag 7 <> encode ann <> encode pat <> encode arg <> encode t
        Error    ann ty        -> encodeConstructorTag 8 <> encode ann <> encode ty
        Builtin  ann bn        -> encodeConstructorTag 9 <> encode ann <> encode bn

    decode = go =<< decodeConstructorTag
        where go 0 = Var      <$> decode <*> decode
              go 1 = TyAbs    <$> decode <*> decode <*> decode <*> decode
              go 2 = LamAbs   <$> decode <*> decode <*> decode <*> decode
              go 3 = Apply    <$> decode <*> decode <*> decode
              go 4 = Constant <$> decode <*> decode
              go 5 = TyInst   <$> decode <*> decode <*> decode
              go 6 = Unwrap   <$> decode <*> decode
              go 7 = IWrap    <$> decode <*> decode <*> decode <*> decode
              go 8 = Error    <$> decode <*> decode
              go 9 = Builtin  <$> decode <*> decode
              go _ = fail "Failed to decode Term TyName Name ()"

instance ( Flat ann
         , Flat tyname
         , Flat name
         ) => Flat (Program tyname name DefaultUni ann) where
    encode (Program ann v t) = encode ann <> encode v <> encode t
    decode = Program <$> decode <*> decode <*> decode
