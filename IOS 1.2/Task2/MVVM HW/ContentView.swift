//
//  ContentView.swift
//  MVVM HW
//
//  Created by А on 04.06.2025.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 0
    var body: some View {
        VStack {
            HStack{
                Button(action:{
                    self.selected = 0
                }) {
                    Image(systemName: "map")
                        .foregroundColor(self.selected == 0 ? .black : .gray)
                    
                    Spacer(minLength: 12)
                }
                
            }
        }
    }
}

#Preview {
    ContentView()
}
