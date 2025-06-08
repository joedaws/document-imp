module Main (main) where

import System.Environment

import NoteManager.Action (help, helpNoMatchCommand, newNote)

data Action = Help | HelpNoMatch String | New

{- | The first word is a command and the rest is the argument
  of the command.
-}
parseArgs :: [String] -> (Action, [String])
parseArgs [] = (Help, [])
parseArgs (x : xs) = case x of
    "help" -> (Help, xs)
    "new" -> (New, xs)
    _ -> (HelpNoMatch x, xs)

main :: IO ()
main = do
    args <- getArgs
    let (cmd, rest) = parseArgs args
    case cmd of
        Help -> help
        New -> newNote $ unwords rest
        HelpNoMatch unknownCmd -> helpNoMatchCommand unknownCmd
