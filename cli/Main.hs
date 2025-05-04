module Main (main) where

import System.Environment

import DocumentImp.Command (help, helpNoMatchCommand)

data Command = Help | HelpNoMatch String

{- | The first word is a command and the rest is the argument
  of the command.
-}
parseArgs :: [String] -> (Command, [String])
parseArgs [] = (Help, [])
parseArgs (x : xs) = case x of
    "help" -> (Help, xs)
    _ -> (HelpNoMatch x, xs)

main :: IO ()
main = do
    args <- getArgs
    let (cmd, _) = parseArgs args
    case cmd of
        Help -> help
        HelpNoMatch unknownCmd -> helpNoMatchCommand unknownCmd
