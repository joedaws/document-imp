{-
  File: DocumentImp/Tempalte/Note.hs
  Date: 2025-05-03
-}

module DocumentImp.Template.Note (
    noteFile,
) where

import DocumentImp.Document (Document, Title, writeDocument)

notePreamble :: Document
notePreamble = "Hello, world\n"

noteFile :: Title -> IO ()
noteFile t = writeDocument t notePreamble
