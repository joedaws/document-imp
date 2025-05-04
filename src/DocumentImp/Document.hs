{-
  File: DocumentImp/Document.hs
  Date: 2025-05-03
-}

module DocumentImp.Document (
    Document,
    Title,
    writeDocument,
) where

import Data.Char (isSpace)

type Document = String
type Title = String

replaceWhitespace :: String -> String
replaceWhitespace = map (\c -> if isSpace c then '-' else c)

titleToFilePath :: String -> String
titleToFilePath s = replaceWhitespace s ++ ".md"

writeDocument :: Title -> Document -> IO ()
writeDocument title d = do
    writeFile (titleToFilePath title) d
