//
//  ContentView.swift
//  User Profile
//
//  Created by А on 02.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
    NavigationStack{
        VStack(spacing: 10){
            Text("Alikhan Zhumabekv")
                .bold()
                .foregroundColor(.blue)
            
            Image(systemName: "person.circle")
                .foregroundColor(.blue)
            
            HStack{
                Text("Age:16")
                Image(systemName: "richtext.page.fill")
                
                Text("Location: Kazakhstan")
                Image(systemName: "map")
                
                Text("Hobbies: Swimming")
                Image(systemName: "figure.open.water.swim")
            }
            
       
                
            NavigationLink("View Details", destination: Profile())
                        .bold()
                }
            }
            
        }
    }

struct Profile: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        VStack{
            Image(systemName: "globe.central.south.asia")
                .font(.largeTitle)
            Text("nFactorial Incubator '25 ").bold()
            Button("Go Back"){
                dismiss()
            }.bold()
        }
    }
}



#Preview {
    ContentView()
}
