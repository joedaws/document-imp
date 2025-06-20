{-# LANGUAGE DeriveGeneric #-}

module NoteManager.FrontMatter (
    Preamble (..),
    mkPreamble,
)
where

import Data.Aeson (FromJSON (..), ToJSON (..), defaultOptions, genericToEncoding)
import Data.Time (UTCTime, getCurrentTime)
import Data.UUID (UUID)
import Data.UUID.V4 (nextRandom)
import GHC.Generics

data Preamble = Preamble
    { noteManId :: UUID
    , date :: UTCTime
    }
    deriving (Generic, Show)

instance ToJSON Preamble where
    -- No need to provide a toJSON implementation.

    -- For efficiency, we write a simple toEncoding implementation, as
    -- the default version uses toJSON.
    toEncoding = genericToEncoding defaultOptions

instance FromJSON Preamble

-- No need to provide a parseJSON implementation.

mkPreamble :: IO Preamble
mkPreamble = do
    now <- getCurrentTime
    uuid <- nextRandom
    return $ Preamble{noteManId = uuid, date = now}
