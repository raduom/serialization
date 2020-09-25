{-# LANGUAGE DerivingVia        #-}
{-# LANGUAGE FlexibleContexts   #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications   #-}
{-# LANGUAGE TypeOperators   #-}
{-# LANGUAGE UndecidableInstances   #-}

module Plutus.Flat where

-- As: plutus-core/src/Language/PlutusCore/CBOR.hs

import           Data.Proxy
import           Flat
import           Flat.Decoder
import           Flat.Encoder
import           Language.PlutusCore          (Name (..),
                                               Unique (..))
import           Language.PlutusCore.Universe
import           Language.UntypedPlutusCore

encodeConstructorTag :: Word -> Encoding
encodeConstructorTag = eWord

decodeConstructorTag :: Get Word
decodeConstructorTag = dWord

instance Flat (Term Name DefaultUni ()) where
    encode = \case
        Var      ann n         -> encodeConstructorTag 0 <> encode ann <> encode n
        Delay    ann t         -> encodeConstructorTag 1 <> encode ann <> encode t
        LamAbs   ann n t       -> encodeConstructorTag 2 <> encode ann <> encode n <> encode t
        Apply    ann t t'      -> encodeConstructorTag 3 <> encode ann <> encode t <> encode t'
        Constant ann c         -> encodeConstructorTag 4 <> encode ann <> encode c
        Force    ann t         -> encodeConstructorTag 5 <> encode ann <> encode t
        Error    ann           -> encodeConstructorTag 6 <> encode ann
        Builtin  ann bn        -> encodeConstructorTag 7 <> encode ann <> encode bn

    decode = go =<< decodeConstructorTag
        where go 0 = Var      <$> decode <*> decode
              go 1 = Delay    <$> decode <*> decode
              go 2 = LamAbs   <$> decode <*> decode <*> decode
              go 3 = Apply    <$> decode <*> decode <*> decode
              go 4 = Constant <$> decode <*> decode
              go 5 = Force    <$> decode <*> decode
              go 6 = Error    <$> decode
              go 7 = Builtin  <$> decode <*> decode
              go _ = fail "Failed to decode Term TyName Name ()"

instance Flat (Some (TypeIn DefaultUni)) where
  encode (Some (TypeIn uni)) = encode . map (fromIntegral  :: Int -> Word) $ encodeUni uni

  decode = go . decodeUni . map (fromIntegral :: Word -> Int) =<< decode where
    go Nothing    = fail "Failed to decode a universe"
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
    encode (Name txt u) = encode txt <> encode u
    decode = Name <$> decode <*> decode

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

-- instance ( Flat ann
--          , Flat name
--          ) => Flat (Term name DefaultUni ann) where
--     encode = \case
--         Var      ann n    -> encodeConstructorTag 0 <> encode ann <> encode n
--         LamAbs   ann n t  -> encodeConstructorTag 2 <> encode ann <> encode n <> encode t
--         Apply    ann t t' -> encodeConstructorTag 3 <> encode ann <> encode t <> encode t'
--         Constant ann c    -> encodeConstructorTag 4 <> encode ann <> encode c
--         Delay    ann t    -> encodeConstructorTag 1 <> encode ann <> encode t
--         Force    ann t    -> encodeConstructorTag 5 <> encode ann <> encode t
--         Error    ann      -> encodeConstructorTag 8 <> encode ann
--         Builtin  ann bn   -> encodeConstructorTag 9 <> encode ann <> encode bn

--     decode = go =<< decodeConstructorTag
--         where go 0 = Var      <$> decode <*> decode
--               go 1 = Delay    <$> decode <*> decode
--               go 2 = LamAbs   <$> decode <*> decode <*> decode
--               go 3 = Apply    <$> decode <*> decode <*> decode
--               go 4 = Constant <$> decode <*> decode
--               go 5 = Force    <$> decode <*> decode
--               go 8 = Error    <$> decode
--               go 9 = Builtin  <$> decode <*> decode
--               go _ = fail "Failed to decode Term TyName Name ()"
