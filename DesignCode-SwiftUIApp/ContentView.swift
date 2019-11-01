//
//  ContentView.swift
//  DesignCode-SwiftUIApp
//
//  Created by Alter Ego on 10/27/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var isShown = false
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: isShown ? 20 : 0)
                .animation(.default)
            
            CardBottomView()
                .blur(radius: isShown ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(isShown ? Color.red : Color.blue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.85)
                .offset(x: 0, y: isShown ? -40 : -20)
                .rotationEffect(Angle(degrees: isShown ? 15 : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.7))
            
            CardView()
                .background(isShown ? Color.red : Color.blue)
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.9)
                .offset(x: 0, y: isShown ? -20 : -10)
                .rotationEffect(Angle(degrees: isShown ? 10 : 0))
                .blendMode(.hardLight)
                .animation(.easeInOut(duration: 0.5))
            
            CertificateView()
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: isShown ? 5 : 0))
                .animation(.spring())
                .offset(x: viewState.width, y: viewState.height)
                .onTapGesture {
                    self.isShown.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            self.viewState = value.translation
                            self.isShown = true
                        }
                    .onEnded { value in
                        self.viewState = CGSize.zero
                        self.isShown = false 
                    }
                )
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    var body: some View {
        VStack {
            Text("Card Back")
        }
        .frame(width: 340, height: 220)
    }
}

struct CertificateView: View {
    var body: some View {
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
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }
        .padding()
    }
}

struct CardBottomView: View {
    var body: some View {
        VStack(spacing: 20.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3.0)
                .opacity(0.1)
            Text("Yihwan Kim is learning how to develop iOS apps using SwiftUI")
                .lineLimit(10)
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .padding(.horizontal)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}
