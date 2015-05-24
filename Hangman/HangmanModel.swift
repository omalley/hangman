//
//  HangmanModel.swift
//  Hangman
//
//  Created by Hazen on 4/12/15.
//  Copyright (c) 2015 Hazen. All rights reserved.
//

import Foundation

class HangmanModel {
    var word = ""
    var userView = ""
    var badGuess = 0
    var charactersLeft = 0
    var wordList = [String]()
    
    func loadWords() {
        let path = NSBundle.mainBundle().pathForResource("words", ofType: "txt")
        let text = String(contentsOfFile: path!, encoding: NSUTF8StringEncoding, error: nil)
        wordList = text!.componentsSeparatedByString("\n")
    }
    
    func pickWord() {
        let random = Int(arc4random_uniform(UInt32(wordList.count - 1)))
        word = wordList[random]
        badGuess = 0
        userView = ""
        for i in 0 ..< count(word) {
            userView += "_ "
        }
        charactersLeft = count(word)
    }
  
    func guessLetter(guess: String) {
        let downcase = guess.lowercaseString
        let guessChar = downcase[downcase.startIndex]
        var match = false
        let oldUser = userView
        userView = ""
        for i in 0 ..< count(word) {
            if word[advance(word.startIndex, i)] == guessChar {
                match = true
                userView += downcase + " "
                charactersLeft -= 1
            } else {
                userView += String(oldUser[advance(oldUser.startIndex, i * 2)]) + " "
            }
        }
        if !match {
            badGuess += 1
        }
    }
}