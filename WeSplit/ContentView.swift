//
//  ContentView.swift
//  WeSplit
//
//  Created by Tesco Labs on 04/03/2024.
//

import SwiftUI

struct ContentView: View {
    @State var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        
        }
    }
    

        
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        }
    }
}
