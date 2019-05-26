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
      do {
        if let filepath = Bundle.main.path(forResource: "words", ofType: "txt") {
          let contents = try String(contentsOfFile: filepath,
                                    encoding: String.Encoding.utf8)
          wordList = contents.components(separatedBy: "\n")
        }
      } catch let error as NSError {
        print(error.localizedDescription)
      }
    }
    
    func pickWord() {
        let random = Int(arc4random_uniform(UInt32(wordList.count - 1)))
        word = wordList[random]
        badGuess = 0
        userView = ""
        for _ in word {
            userView += "_ "
        }
        charactersLeft = word.count
    }
  
    func guessLetter(guess: String) {
      let lowerGuess = guess.lowercased()
      let guessChar = lowerGuess[lowerGuess.startIndex]
        var match = false
        let oldUser = userView
        userView = ""
        for i in 0 ..< word.count {
          if word[word.index(word.startIndex, offsetBy: i)] == guessChar {
                match = true
                userView += lowerGuess + " "
                charactersLeft -= 1
            } else {
                userView += String(oldUser[oldUser.index(oldUser.startIndex,
                                                         offsetBy: i*2)]) + " "
            }
        }
        if !match {
            badGuess += 1
        }
    }
}
