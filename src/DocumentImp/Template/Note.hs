{-
  File: DocumentImp/Tempalte/Note.hs
  Date: 2025-05-03
-}
{-# LANGUAGE OverloadedStrings #-}

module DocumentImp.Template.Note (
    noteFile,
) where

import qualified Data.ByteString.Char8 as BS
import Data.Yaml (encode)

import DocumentImp.Document (Document, Title, writeDocument)
import DocumentImp.FrontMatter (Preamble (..), mkPreamble)

noteFile :: Title -> IO ()
noteFile t = do
    preamble <- mkPreamble t
    let preambleStr = encode preamble
    let yamlHeader = "---\n" ++ BS.unpack preambleStr ++ "---\n"
    writeDocument t (BS.pack yamlHeader)
