//
//  Home.swift
//  OneClick!
//
//  Created by Fam Van Anh on 1.04.21.
//  Copyright © 2021 Fam Van Anh. All rights reserved.
//

import SwiftUI

struct NavigationBar: View {
    @State private var selection = 1
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    var body: some View {
        TabView(selection: $selection) {
            HomeView().tabItem {
                VStack {
                    Image(systemName: "house")
                    Text("Home")
                }
                
            }.tag(1)
            
            OrderCardView().tabItem {
                VStack {
                    Image(systemName: "calendar")
                    Text("Reserved")
                }
                
            }.tag(2)
            
            MoreView().tabItem {
                VStack {
                    Image(systemName: "line.horizontal.3")
                    Text("More")
                }
                
            }.tag(3)
        }
        .accentColor(.blue)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar()
    }
}
