{-# LANGUAGE DataKinds          #-}
{-# LANGUAGE DeriveAnyClass     #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE FlexibleInstances  #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE TemplateHaskell    #-}
{-# LANGUAGE TypeApplications   #-}

module Dataset ( carsData
               , irisData
               , plutusContracts
               ) where
import           Codec.Serialise                                       as CBOR
import           Control.DeepSeq
import           Data.Bifunctor                                        (second)
import qualified Data.Binary                                           as B
import qualified Data.Persist                                          as R
import qualified Data.Serialize                                        as C
import qualified Data.Store                                            as S
import qualified Flat                                                  as F
import           Numeric.Datasets                                      (getDataset)
-- import           Numeric.Datasets.Abalone   (abalone)
import           Numeric.Datasets.Car
import           Numeric.Datasets.Iris

import           Language.Plutus.Contract.Trace
import qualified Language.PlutusCore                                   as TPLC
import           Language.PlutusCore.Universe
import qualified Language.PlutusTx.Code                                as PlutusTx
import qualified Language.PlutusTx.Coordination.Contracts.Crowdfunding as Crowdfunding
import qualified Language.PlutusTx.Coordination.Contracts.Escrow       as Escrow
import qualified Language.PlutusTx.Coordination.Contracts.Future       as Future
import qualified Language.PlutusTx.Coordination.Contracts.Game         as Game
import qualified Language.PlutusTx.Coordination.Contracts.Vesting      as Vesting
import qualified Language.PlutusTx.TH                                  as PlutusTx
import           Language.UntypedPlutusCore
import qualified Ledger                                                as Ledger
import qualified Ledger.Ada                                            as Ada
import           Ledger.Crypto
import qualified Ledger.Scripts                                        as Plutus
import qualified Ledger.Typed.Scripts                                  as Plutus
import           Ledger.Value

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

instance NFData (Term TPLC.Name DefaultUni ())

wallet1, wallet2, wallet3 :: Wallet
wallet1 = Wallet 1
wallet2 = Wallet 2
wallet3 = Wallet 3

escrowParams :: Escrow.EscrowParams d
escrowParams =
  Escrow.EscrowParams
    { Escrow.escrowDeadline = 200
    , Escrow.escrowTargets  =
        [ Escrow.payToPubKeyTarget (pubKeyHash $ walletPubKey wallet1)
                                   (Ada.lovelaceValueOf 10)
        , Escrow.payToPubKeyTarget (pubKeyHash $ walletPubKey wallet2)
                                   (Ada.lovelaceValueOf 20)
        ]
    }

vesting :: Vesting.VestingParams
vesting =
    Vesting.VestingParams
        { Vesting.vestingTranche1 =
            Vesting.VestingTranche (Ledger.Slot 10) (Ada.lovelaceValueOf 20)
        , Vesting.vestingTranche2 =
            Vesting.VestingTranche (Ledger.Slot 20) (Ada.lovelaceValueOf 40)
        , Vesting.vestingOwner    = Ledger.pubKeyHash $ walletPubKey wallet1 }

-- Future data
forwardPrice :: Value
forwardPrice = Ada.lovelaceValueOf 1123

penalty :: Value
penalty = Ada.lovelaceValueOf 1000

units :: Integer
units = 187

oracleKeys :: (PrivateKey, PubKey)
oracleKeys =
    let wllt = Wallet 10 in
        (walletPrivKey wllt, walletPubKey wllt)

accounts :: Future.FutureAccounts
accounts =
    either error id
        $ evalTrace @Future.FutureSchema @Future.FutureError
            Future.setupTokens
            ( handleBlockchainEvents wallet1 >>
              addBlocks 1 >>
              handleBlockchainEvents wallet1 >>
              addBlocks 1 >>
              handleBlockchainEvents wallet1 ) wallet1

theFuture :: Future.Future
theFuture = Future.Future {
    Future.ftDeliveryDate  = Ledger.Slot 100,
    Future.ftUnits         = units,
    Future.ftUnitPrice     = forwardPrice,
    Future.ftInitialMargin = Ada.lovelaceValueOf 800,
    Future.ftPriceOracle   = snd oracleKeys,
    Future.ftMarginPenalty = penalty
    }

-- Plutus contracts
eraseTypes
  :: TPLC.Program TPLC.TyName TPLC.Name DefaultUni ()
  -> Term TPLC.Name DefaultUni ()
eraseTypes (TPLC.Program () _ t) = erase t

plutusContracts :: [ (String, Term TPLC.Name DefaultUni ()) ]
plutusContracts = map (second (eraseTypes . Plutus.unScript . Plutus.unValidatorScript))
  [ ("game", Game.gameValidator)
  , ("crowdfunding", Crowdfunding.contributionScript Crowdfunding.theCampaign)
  , ("vesting", Vesting.vestingScript vesting)
  , ("escrow", Plutus.validatorScript $ Escrow.scriptInstance escrowParams)
  , ("future", Future.validator theFuture accounts) ] ++

  [ ("future-partial",
      eraseTypes $
        PlutusTx.getPlc $$(PlutusTx.compile [|| Future.futureStateMachine ||])) ]

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
