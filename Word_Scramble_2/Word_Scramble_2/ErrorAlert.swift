//
//  ErrorAlert.swift
//  Word_Scramble_2
//
//  Created by Marc Khoury on 16/12/2020.
//

import SwiftUI

enum ErrorAlert {
    
    static let notValid = Alert(title: Text("Nope!"),
                                message: Text("You can do better than that!"),
                                dismissButton: .default(Text("Ok")))
    
    static let notReal = Alert(title: Text("Word not possible"),
                               message: Text("That isn't a real word!"),
                               dismissButton: .default(Text("Ok")))
    
    static let notOriginal = Alert(title: Text("Word used already!"),
                                   message: Text("Be more original"),
                                   dismissButton: .default(Text("Ok")))
    
    static let notPossible = Alert(title: Text("Word not recognized!"),
                                   message: Text("You can't just make them up you know!"),
                                   dismissButton: .default(Text("Ok")))
}
