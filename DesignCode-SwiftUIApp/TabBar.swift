//
//  TabBar.swift
//  DesignCode-SwiftUIApp
//
//  Created by Alter Ego on 11/3/19.
//  Copyright © 2019 Yihwan Kim. All rights reserved.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            Home().tabItem({
                Text("Home")
                Image("IconHome")
            }).tag(1)
            
            ContentView().tabItem({
                Image("IconCards")
                Text("Certificates")
            }).tag(2)
            
            UpdateList().tabItem({
                Image("IconSettings")
                Text("Updates")
            }).tag(3)
            .edgesIgnoringSafeArea(.top)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TabBar()
            TabBar()
                .environment(\.colorScheme, .dark)
                .environment(\.sizeCategory, .extraLarge)
        }
    }
}
