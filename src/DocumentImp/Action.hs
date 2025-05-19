{-# LANGUAGE OverloadedStrings #-}

-- | A module with the core commands
module DocumentImp.Action (
    help,
    helpNoMatchCommand,
    newNote,
) where

import System.Console.ANSI (
    Color (..),
    ColorIntensity (..),
    ConsoleLayer (..),
    SGR (..),
    setSGR,
 )

import DocumentImp.Document (Title)
import DocumentImp.Template.Note (noteFile)

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
    putStrLn "      Create a new markdown document for a note."

    coloredPutStr Green "  help\n"
    putStrLn "      prints this help message."

helpNoMatchCommand :: String -> IO ()
helpNoMatchCommand cmd = do
    putStr "ERROR: "
    coloredPutStr Red cmd
    putStrLn " is not a known command."
    help

newNote :: Title -> IO ()
newNote = noteFile
