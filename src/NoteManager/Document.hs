{-
  File: NoteManager/Document.hs
  Date: 2025-05-03
-}
{-# LANGUAGE OverloadedStrings #-}

module NoteManager.Document (
    Document,
    Title,
    writeDocument,
)
where

import qualified Data.ByteString as BS
import Data.Char (isSpace)

type Document = BS.ByteString

type Title = String

replaceWhitespace :: String -> String
replaceWhitespace = map (\c -> if isSpace c then '-' else c)

titleToFilePath :: String -> String
titleToFilePath s = replaceWhitespace s ++ ".md"

writeDocument :: Title -> Document -> IO String
writeDocument title d = do
    BS.writeFile fileName d
    return fileName
  where
    fileName = titleToFilePath title
