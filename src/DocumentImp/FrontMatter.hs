{-# LANGUAGE DeriveGeneric #-}

module DocumentImp.FrontMatter (
    Preamble (..),
    mkPreamble,
) where

import GHC.Generics

import Data.Aeson (FromJSON (..), ToJSON (..), defaultOptions, genericToEncoding)
import Data.Time (UTCTime, getCurrentTime)

import DocumentImp.Document (Title)

data Preamble = Preamble
    { title :: Title
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

mkPreamble :: Title -> IO Preamble
mkPreamble t = do
    now <- getCurrentTime
    return $ Preamble{title = t, date = now}
