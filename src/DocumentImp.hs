{-# LANGUAGE OverloadedStrings #-}

-- | A module with the core commands
module DocumentImp (
    help,
    helpNoMatchCommand,
) where

import System.Console.ANSI (
    Color (..),
    ColorIntensity (..),
    ConsoleLayer (..),
    SGR (..),
    setSGR,
 )

coloredPutStr :: Color -> String -> IO ()
coloredPutStr color msg = do
    setSGR [SetColor Foreground Vivid color] -- Turn color on
    putStr msg
    setSGR [Reset] -- Reset back to default

help :: IO ()
help = do
    putStrLn "Usage: dimp <command> <command-arguments>"
    putStrLn "The following commands are available:"

    coloredPutStr Green "  new\n"
    putStrLn "      Create a new markdown document with template for note."

    coloredPutStr Green "  help\n"
    putStrLn "      prints this help message."

helpNoMatchCommand :: String -> IO ()
helpNoMatchCommand cmd = do
    putStr "ERROR: "
    coloredPutStr Red cmd
    putStrLn " is not a known command."
    help
