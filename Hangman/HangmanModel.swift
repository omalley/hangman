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
    let WORD_LIST = ["caterwhauling", "gadzooks", "banana", "zap", "apple", "ante", "mattock", "jalopy", "hassling","acrid","acidic","sadistic","beheaded","eagle","ramparts", "haggard", "lamb", "draconic", "warring", "antelope", "dangerous", "amazing", "alliance", "rag", "applied", "yak", "plastered", "espionage", "vorpal", "ghastly", "pea", "congratulations", "established", "landfill", "trashed", "ammonia", "throaty", "bask", "lateral", "parry", "origami", "undulating", "polarized", "axe"]
    var charactersLeft = 0
    
    func pickWord() {
        let random = Int(arc4random_uniform(UInt32(WORD_LIST.count - 1)))
        word = WORD_LIST[random]
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