{-
  File: NoteManager/Tempalte/Note.hs
  Date: 2025-05-03
-}
{-# LANGUAGE OverloadedStrings #-}

module NoteManager.Template.Note (
    noteFile,
)
where

import qualified Data.ByteString.Char8 as BS
import Data.Yaml (encode)
import NoteManager.Document (Document, Title, writeDocument)
import NoteManager.FrontMatter (Preamble (..), mkPreamble)

noteFile :: Title -> IO String
noteFile t = do
    preamble <- mkPreamble
    let preambleStr = encode preamble
    let yamlHeader = "---\n" ++ BS.unpack preambleStr ++ "---\n"
    writeDocument t (BS.pack yamlHeader)
