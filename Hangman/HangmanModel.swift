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
    let WORD_LIST = ["caterwauling", "gadzooks", "banana", "zap", "apple", "ante", "mattock", "jalopy", "hassling","acrid","acidic","sadistic","beheaded","eagle","ramparts", "haggard", "lamb", "draconic", "warring", "antelope", "dangerous", "amazing", "alliance", "rag", "applied", "yak", "plastered", "espionage", "vorpal", "ghastly", "pea", "congratulations", "established", "landfill", "trashed", "ammonia", "throaty", "bask", "lateral", "parry", "origami", "undulating", "polarized", "axe", "erratic", "half", "discrimination", "crash", "solemn", "pragmatic", "magic", "bland", "spicy", "egregious", "next", "xenophobia", "invisibility", "invincibility", "bramble","corrupted", "government", "implored", "sabotage", "deposite", "supple", "pipes", "interior", "convex", "insomniac", "impressive", "kangaroo", "marsupial", "conclave", "mighty", "subterranian", "elongate", "intrude", "blunt", "uncharacteristically", "frightening", "show", "geek", "omnipotent", "omniscient", "ressurected", "embryotic", "complacent", "incongrous", "halfhearted", "meek", "morbid", "porous", "system", "online", "resolute", "protectorate", "thesis", "monstrosity", "six", "adroit", "humor", "malware", "retinal", "potato", "tally", "anticlimatic", "chafe", "cutter", "douse", "geese", "bagged", "throttle", "exorbitant", "mantra", "imbecilic", "warped", "crystalline", "pillow", "painting", "gingerbread", "cabinet", "president", "obvious", "survive", "blatant", "mythology", "fiesty", "encyclopedia", "architecture", "cheesy", "unicycle", "voluptuous", "patio", "lanai", "muddling", "aardvark", "plastic", "eskimo", "benign", "silhouhette", "sabbatical", "quarry", "jazzy", "buzz", "fizz", "jinx", "puff", "dizzy", "junk", "quiz", "ascent", "collection", "modern", "babbling", "cookiness", "artsy", "fluffiest", "sleeveless", "yammering", "faking", "queing", "olfactory", "joking", "zigzag", "integral", "masculine", "forlorn", "wham", "organized", "allegory", "egocentric", "composite", "juxtaposition", "plethora", "paltry", "dearth", "stratagem", "postulate", "plausible", "vigilance", "tacit", "scrutinize", "oblivious", "assertive", "vehement", "flout", "headstrong", "arbitrary", "spontaniety", "copious", "proliferate", "embargo", "peon", "sophistry", "verbose", "prattle", "circumlocution", "candid", "criterion", "trite", "idiosyncrasy", "virtuoso", "aptitude", "finesse", "acme", "anathema", "debilitate", "eulogy", "impossible", "organic", "tongue", "dairy", "limit", "parking", "wait", "oligarchy", "homestead", "automobile", "gasoline", "service", "extra", "luxury", "apartment", "biking", "preamble", "convoy", "flotilla", "independence", "ordain", "blessing", "market", "bell", "orthotics", "acupuncture", "establlished", "circa", "fireplug", "spaceship", "defense", "common", "quail", "community", "pride", "dogmatic", "hawaiian", "licensce", "pizza", "crossing", "laundromat", "emergency", "subway", "entry", "carpool", "express", "espresso", "doughnut", "groceries", "cofeee", "careening", "ridge", "canyon", "pepper", "rugged", "stump", "jasmine", "sapphire", "apparition", "reality", "chase", "brouhaha", "style", "caste", "cuisine", "sine", "sauce", "aluminum", "elements", "rabbi", "brakish", "pliable", "serviceable", "arrogant", "jacket", "dry", "paramedic", "ostracize", "police", "corp", "ogled", "rancid", "argon", "dread", "lording", "swerve", "nasty", "oval", "oxidize", "island", "oppression", "eerie", "intellect", "shake", "symbiosis", "trauma", "black", "white", "pilot", "formula", "motors", "liquor", "serve", "yogurt", "dire", "sorcerous", "crawl", "prat", "mud", "socialist", "communist", "extremes", "prodded", "vineyard", "rare", "gimp"]
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