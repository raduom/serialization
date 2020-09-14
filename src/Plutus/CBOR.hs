{-# LANGUAGE DerivingVia        #-}
{-# LANGUAGE FlexibleContexts   #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE LambdaCase         #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TypeApplications   #-}

module Plutus.CBOR where

-- As: plutus-core/src/Language/PlutusCore/CBOR.hs

import           Codec.CBOR.Decoding
import           Codec.CBOR.Encoding
import           Codec.Serialise
import           Language.PlutusCore          ()
import           Language.PlutusCore.Universe
import           Language.UntypedPlutusCore

encodeConstructorTag :: Word -> Encoding
encodeConstructorTag = encodeWord

decodeConstructorTag :: Decoder s Word
decodeConstructorTag = decodeWord

instance ( Serialise ann
         , Serialise name
         ) => Serialise (Term name DefaultUni ann) where
    encode = \case
        Var      ann n    -> encodeConstructorTag 0 <> encode ann <> encode n
        LamAbs   ann n t  -> encodeConstructorTag 2 <> encode ann <> encode n <> encode t
        Apply    ann t t' -> encodeConstructorTag 3 <> encode ann <> encode t <> encode t'
        Constant ann c    -> encodeConstructorTag 4 <> encode ann <> encode c
        Delay    ann t    -> encodeConstructorTag 1 <> encode ann <> encode t
        Force    ann t    -> encodeConstructorTag 5 <> encode ann <> encode t
        Error    ann      -> encodeConstructorTag 8 <> encode ann
        Builtin  ann bn   -> encodeConstructorTag 9 <> encode ann <> encode bn

    decode = go =<< decodeConstructorTag
        where go 0 = Var      <$> decode <*> decode
              go 1 = Delay    <$> decode <*> decode
              go 2 = LamAbs   <$> decode <*> decode <*> decode
              go 3 = Apply    <$> decode <*> decode <*> decode
              go 4 = Constant <$> decode <*> decode
              go 5 = Force    <$> decode <*> decode
              go 8 = Error    <$> decode
              go 9 = Builtin  <$> decode <*> decode
              go _ = fail "Failed to decode Term TyName Name ()"
