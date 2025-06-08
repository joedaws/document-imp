{-# LANGUAGE OverloadedStrings #-}

-- | A module with the core commands
module NoteManager.Action
  ( help,
    helpNoMatchCommand,
    newNote,
  )
where

import NoteManager.Document (Title)
import NoteManager.Template.Note (noteFile)
import System.Console.ANSI
  ( Color (..),
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
  putStrLn "Usage: noteman <command> <command-arguments>"
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
