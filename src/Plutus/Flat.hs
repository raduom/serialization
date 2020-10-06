{-# LANGUAGE DerivingVia          #-}
{-# LANGUAGE FlexibleContexts     #-}
{-# LANGUAGE FlexibleInstances    #-}
{-# LANGUAGE LambdaCase           #-}
{-# LANGUAGE OverloadedStrings    #-}
{-# LANGUAGE StandaloneDeriving   #-}
{-# LANGUAGE TypeApplications     #-}
{-# LANGUAGE TypeOperators        #-}
{-# LANGUAGE UndecidableInstances #-}

module Plutus.Flat where

-- As: plutus-core/src/Language/PlutusCore/CBOR.hs

import qualified Codec.Serialise                     as CBOR
import           Data.Proxy
import           Flat
import           Flat.Decoder
import           Flat.Encoder
import           Language.PlutusCore                 (Name (..), Unique (..))
import           Language.PlutusCore.Universe
import           Language.UntypedPlutusCore
import           Language.UntypedPlutusCore.DeBruijn

instance (Flat name) => Flat (Term name DefaultUni ()) where
    encode = \case
        Var      ann n         -> eBits 4 0 <> encode ann <> encode n
        Delay    ann t         -> eBits 4 1 <> encode ann <> encode t
        LamAbs   ann n t       -> eBits 4 2 <> encode ann <> encode n <> encode t
        Apply    ann t t'      -> eBits 4 3 <> encode ann <> encode t <> encode t'
        Constant ann c         -> eBits 4 4 <> encode ann <> encode c
        Force    ann t         -> eBits 4 5 <> encode ann <> encode t
        Error    ann           -> eBits 4 6 <> encode ann
        Builtin  ann bn        -> eBits 4 7 <> encode ann <> encode bn

    decode = go =<< dBEBits8 4
        where go 0 = Var      <$> decode <*> decode
              go 1 = Delay    <$> decode <*> decode
              go 2 = LamAbs   <$> decode <*> decode <*> decode
              go 3 = Apply    <$> decode <*> decode <*> decode
              go 4 = Constant <$> decode <*> decode
              go 5 = Force    <$> decode <*> decode
              go 6 = Error    <$> decode
              go 7 = Builtin  <$> decode <*> decode
              go _ = fail "Failed to decode Term TyName Name ()"

    size t acc = case t of
        Var      ann n         -> 4 + size ann 0 + size n acc
        Delay    ann t         -> 4 + size ann 0 + size t acc
        LamAbs   ann n t       -> 4 + size ann 0 + size n 0 + size t  acc
        Apply    ann t t'      -> 4 + size ann 0 + size t 0 + size t' acc
        Constant ann c         -> 4 + size ann 0 + size c acc
        Force    ann t         -> 4 + size ann 0 + size t acc
        Error    ann           -> 4 + size ann acc
        Builtin  ann bn        -> 4 + size ann 0 + size bn acc

instance Flat (Some (TypeIn DefaultUni)) where
  encode (Some (TypeIn uni)) = encode . (fromIntegral  :: Int -> Word) $ head (encodeUni uni)

  decode = go . decodeUni . (\x -> [x]) . (fromIntegral :: Word -> Int) =<< decode where
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
    encode = eBits 5 . \case
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

    decode = go =<< dBEBits8 5
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

    size _ n = n + 5

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
    encode (StaticBuiltinName bn) = eBits 1 0 <> encode bn
    encode (DynBuiltinName   dbn) = eBits 1 1 <> encode dbn

    decode = go =<< dBEBits16 1
        where go 0 = StaticBuiltinName <$> decode
              go 1 = DynBuiltinName    <$> decode
              go _ = fail "Failed to decode Builtin ()"

    size (StaticBuiltinName bn) n = 1 + size bn n
    size (DynBuiltinName   dbn) n = 1 + size dbn n

instance Flat NamedDeBruijn where
    encode (NamedDeBruijn _ i) = encode i
    decode = NamedDeBruijn "" <$> decode

instance CBOR.Serialise NamedDeBruijn where
    encode (NamedDeBruijn _ i) = CBOR.encode i
    decode = NamedDeBruijn "" <$> CBOR.decode

instance Flat Index where
    encode (Index n) = encode (toInteger n)
    decode = Index . fromInteger <$> decode
