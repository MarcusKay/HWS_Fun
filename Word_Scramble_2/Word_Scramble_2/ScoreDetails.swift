//
//  ScoreDetails.swift
//  Word_Scramble_2
//
//  Created by Marc Khoury on 16/12/2020.
//

import SwiftUI

enum ScoreDetails {
    static let title = Text("Score Details")
    
    static let message = Text("""
                Each Word Gives 1.5 pts
                ________________
                
                Length Score = (# of letters - 2) pts
                """
    )
    
    static let alert = Alert(title: ScoreDetails.title, message: ScoreDetails.message, dismissButton: .default(Text("OK")))
}
