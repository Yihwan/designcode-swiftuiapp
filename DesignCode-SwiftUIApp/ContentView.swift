//
//  ContentView.swift
//  DesignCode-SwiftUIApp
//
//  Created by Alter Ego on 10/27/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            // Card back
            VStack {
                Text("Card Back")
            }
            .frame(width: 300, height: 220)
            .background(Color.blue)
            .cornerRadius(10)
            .shadow(radius: 20)
            .offset(x: 0, y: -20)
            
            // Card main
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("UI Design")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(Color("accent"))
                            .padding(.top)
                        Text("Certificate")
                            .foregroundColor(.white)
                    }
                    Spacer()
                    
                    Image("Logo")
                        .resizable()
                        .frame(width: 30, height: 30)
                }
                .padding(.horizontal)
                
                Image("Background")
            }
            .frame(width: 340.0, height: 220)
            .background(Color.black)
            .cornerRadius(10)
            .shadow(radius: 20)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
