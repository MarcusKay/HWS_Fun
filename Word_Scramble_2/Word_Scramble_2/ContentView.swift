//
//  ContentView.swift
//  Word_Scramble_2
//
//  Created by MarcusKay on 16/12/2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var rootWord = ""
    @State private var inputWord = ""
    @State private var usedWords =  [String]()
    
    @State private var errorAlert = ErrorAlert.notValid
    @State private var showingWordError = false
    
    @State private var showingScoreDetails = false
    
    @State private var userScore = 0.0
    
    var body: some View {
        
        NavigationView {
            VStack {
                TextField("Enter Word", text: $inputWord, onCommit: addNewWord)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                
                List(usedWords, id: \.self) { word in
                    Image(systemName: "\(word.count).circle")
                        .foregroundColor(.green)
                    Text(word)
                }
                
                Text("Currrent Word Score is: \(userScore, specifier: "%g")")
                    .font(.headline)
                    .foregroundColor(.purple)
                    .padding()
            }
            .navigationBarTitle(rootWord, displayMode: .inline)
            .navigationBarItems(leading:
                                    PlayButton(action: newGame),
                                trailing:
                                    InfoButton(action: { showingScoreDetails = true })
                                )
            .onAppear(perform: newGame)
            .alert(isPresented: $showingWordError) { errorAlert }
        }
        .alert(isPresented: $showingScoreDetails) { ScoreDetails.alert }
    }
    
    
    func newGame() {
        rootWord = GameBrain.allWords.randomElement() ?? "silkworm"
        usedWords = []
        userScore = 0.0
    }
    
    func updateScore(with word: String) {
        let lengthScore = Double(word.count - 2)
        let totalWordsUsedScore = Double(usedWords.count) * 1.5
        userScore += lengthScore + totalWordsUsedScore
    }
    
    func addNewWord() {
        let answer = inputWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        
        guard answer.count > 0 else { return }
        
        switch GameBrain.check(answer, with: rootWord, and: usedWords) {
        case .good:
            usedWords.insert(answer, at: 0)
            updateScore(with: answer)
            inputWord = ""
            return
        case .notValid:
            errorAlert = ErrorAlert.notValid
        case .notReal:
            errorAlert = ErrorAlert.notReal
        case .notOriginal:
            errorAlert = ErrorAlert.notOriginal
        case .notPossible:
            errorAlert = ErrorAlert.notPossible
        }
        showingWordError = true
        inputWord = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
