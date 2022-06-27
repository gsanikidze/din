//
//  HomeScreen.swift
//  DIN
//
//  Created by sano on 6/22/22.
//

import SwiftUI
import CoreData

struct HomeScreen: View {

    
    var body: some View {
        TabView {
            TodoTabScreen()
                .tabItem {
                    Image(systemName: "list.dash")
                }
            
            ChartTabScreen()
                .tabItem {
                    Image(systemName: "chart.bar")
                }
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
