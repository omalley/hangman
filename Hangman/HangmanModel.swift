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
        let text = try? String(contentsOfFile: path!, encoding: NSUTF8StringEncoding)
        wordList = text!.componentsSeparatedByString("\n")
    }
    
    func pickWord() {
        let random = Int(arc4random_uniform(UInt32(wordList.count - 1)))
        word = wordList[random]
        badGuess = 0
        userView = ""
        for _ in 0 ..< word.characters.count {
            userView += "_ "
        }
        charactersLeft = word.characters.count
    }
  
    func guessLetter(guess: String) {
        let downcase = guess.lowercaseString
        let guessChar = downcase[downcase.startIndex]
        var match = false
        let oldUser = userView
        userView = ""
        for i in 0 ..< word.characters.count {
            if word[word.startIndex.advancedBy(i)] == guessChar {
                match = true
                userView += downcase + " "
                charactersLeft -= 1
            } else {
                userView += String(oldUser[oldUser.startIndex.advancedBy(i * 2)]) + " "
            }
        }
        if !match {
            badGuess += 1
        }
    }
}