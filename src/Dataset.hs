{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE StandaloneDeriving #-}
module Dataset(carsData,irisData) where
import           Codec.Serialise       as CBOR
import           Control.DeepSeq
import qualified Data.Binary           as B
import qualified Data.Persist          as R
import qualified Data.Serialize        as C
import qualified Data.Store            as S
import qualified Flat                  as F
import           Numeric.Datasets      (getDataset)
-- import           Numeric.Datasets.Abalone   (abalone)
import           Numeric.Datasets.Car
import           Numeric.Datasets.Iris

instance NFData RelScore
instance B.Binary RelScore
instance C.Serialize RelScore
instance CBOR.Serialise RelScore
instance F.Flat RelScore
instance S.Store RelScore
instance R.Persist RelScore

instance NFData RelSize
instance B.Binary RelSize
instance C.Serialize RelSize
instance CBOR.Serialise RelSize
instance F.Flat RelSize
instance S.Store RelSize
instance R.Persist RelSize

instance NFData Acceptability
instance B.Binary Acceptability
instance C.Serialize Acceptability
instance CBOR.Serialise Acceptability
instance F.Flat Acceptability
instance S.Store Acceptability
instance R.Persist Acceptability

instance NFData Count
instance B.Binary Count
instance C.Serialize Count
instance CBOR.Serialise Count
instance F.Flat Count
instance S.Store Count
instance R.Persist Count

deriving instance Eq Car
instance NFData Car
instance B.Binary Car
instance C.Serialize Car
instance CBOR.Serialise Car
instance F.Flat Car
instance S.Store Car
instance R.Persist Car

deriving instance Eq Iris
instance NFData Iris
instance B.Binary Iris
instance C.Serialize Iris
instance CBOR.Serialise Iris
instance F.Flat Iris
instance S.Store Iris
instance R.Persist Iris

instance NFData IrisClass
instance B.Binary IrisClass
instance C.Serialize IrisClass
instance CBOR.Serialise IrisClass
instance F.Flat IrisClass
instance S.Store IrisClass
instance R.Persist IrisClass

-- irisData = iris
irisData :: [Iris]
irisData = by 500 iris

carsData :: IO [Car]
carsData = by 20 <$> getDataset car
-- carsData = getDataset car
-- abaloneData = by 10 <$> getDataset abalone

by :: Int -> [a] -> [a]
by n = concat . replicate n

-- test :: IO ()
-- test = do
--    -- The Iris data set is embedded
--    print (length iris)
--    print (head iris)
--    cars <- getDataset car
--    print (length cars)
--    print (head cars)
--    -- print $ F.flat cars
--    -- The Abalone dataset is fetched
--    abas <- getDataset abalone
--    print (length abas)
--    print (head abas)
