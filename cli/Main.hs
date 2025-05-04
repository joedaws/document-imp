module Main (main) where

import System.Environment

import DocumentImp.Action (help, helpNoMatchCommand, note)

data Action = Help | HelpNoMatch String | Note

{- | The first word is a command and the rest is the argument
  of the command.
-}
parseArgs :: [String] -> (Action, [String])
parseArgs [] = (Help, [])
parseArgs (x : xs) = case x of
    "help" -> (Help, xs)
    "note" -> (Note, xs)
    _ -> (HelpNoMatch x, xs)

main :: IO ()
main = do
    args <- getArgs
    let (cmd, rest) = parseArgs args
    case cmd of
        Help -> help
        Note -> note $ unwords rest
        HelpNoMatch unknownCmd -> helpNoMatchCommand unknownCmd
