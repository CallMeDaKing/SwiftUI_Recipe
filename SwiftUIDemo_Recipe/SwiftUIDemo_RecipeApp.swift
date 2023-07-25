//
//  SwiftUIDemo_RecipeApp.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

@main
struct SwiftUIDemo_RecipeApp: App {
    
    @StateObject private var recipeBox = RecipeBox(recipes: load("recipeData.json"))
    @State private var selectedSideBarItem: SidebarItem? = SidebarItem.all
    @State private var selectedRecipedId: Recipe.ID?
    
    var body: some Scene {
        WindowGroup {
            NavigationSplitView {
                SidebarView(selection: $selectedSideBarItem, recipeBox: recipeBox)
            } content: {
                ContentListView(selection: $selectedRecipedId, selectedSideBarItem: selectedSideBarItem ?? SidebarItem.all)
            } detail: {
                DetailView(recipeId: $selectedRecipedId)
            }
            .environmentObject(recipeBox)
        }
    }
}
