//
//  RecipeTabView.swift
//  RecipeListApp
//
//  Created by Caleb Corrigan on 6/29/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView {
            
            Text("Featured View")
                .tabItem {
            VStack{
                Image(systemName: "star.fill")
                Text("Featured")
            }
        }
        ContentView()
            .tabItem{
                VStack {
                    Image(systemName: "list.bullet")
                    Text("List")
                }
            }
        
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
}
