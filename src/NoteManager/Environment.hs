-- | Interacting with the environment
module NoteManager.Environment (
    editorProgram,
)
where

import System.Environment (lookupEnv)

editorProgram :: IO (Maybe String)
editorProgram = do
    visualP <- lookupEnv "VISUAL"
    editorP <- lookupEnv "EDITOR"
    return $ maybe editorP (const visualP) visualP
