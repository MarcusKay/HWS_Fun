//
//  NavButtons.swift
//  Word_Scramble_2
//
//  Created by MarcusKay on 16/12/2020.
//

import SwiftUI

struct InfoButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Icon.info
            Text("Scoring")
        }
    }
}

struct PlayButton: View {
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Icon.play
            Text("Next")
        }
    }
}
