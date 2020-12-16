//
//  GameWords.swift
//  Word_Scramble_2
//
//  Created by Marc Khoury on 16/12/2020.
//

import SwiftUI

enum GameBrain {
    
    static let allWords = fetchWords()
    
    static func fetchWords() -> [String] {
        if let wordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") {
            if let fileContent = try? String(contentsOf: wordsURL) {
                let allWords = fileContent.components(separatedBy: "\n")
                return allWords
            } else {
                fatalError("Could not convert to string")
            }
        } else {
            fatalError("Could not find file URL")
        }
        return []
    }

    static func check(_ answer: String, with rootWord: String, and usedWords: [String]) -> WordCheck {
        // Is it valid?
        guard answer.count > 2 else { return .notValid }
        guard answer != rootWord else { return .notValid }

        let checker = UITextChecker()
        let range = NSRange(location: 0, length: answer.utf16.count)
        let misspelledRange = checker.rangeOfMisspelledWord(in: answer, range: range, startingAt: 0, wrap: false, language: "en")
        
        // is it real?
        guard misspelledRange.location == NSNotFound else { return .notReal }
        
        // is it original?
        guard !usedWords.contains(answer) else { return .notOriginal }
        
        // is it Possible?
        var tempWord = rootWord
        for letter in answer {
            if let pos = tempWord.firstIndex(of: letter) {
                tempWord.remove(at: pos)
            } else {
                return .notPossible
            }
        }
        // all clear
        return .good
    }
}

enum WordCheck {
    case notValid, notReal, notOriginal, notPossible, good
}
