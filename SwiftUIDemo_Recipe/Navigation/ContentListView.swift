//
//  ContentListView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

struct ContentListView: View {
    @Binding var selection: Recipe.ID?
    let selectedSideBarItem: SidebarItem
    @EnvironmentObject private var recipeBox: RecipeBox
    @State private var recipeEditorConfig = RecipeEditorConfig()
    
    var body: some View {
        RecipeListView(selection: $selection, selectedSidebarItem: selectedSideBarItem)
            .navigationTitle(selectedSideBarItem.title)
            .toolbar{
                ToolbarItem {
                    Button {
                        recipeEditorConfig.presentAddRecipe(sidebarItem: selectedSideBarItem)
                    } label: {
                        Image(systemName: "plus")
                    }.sheet(isPresented: $recipeEditorConfig.isPressented, onDismiss: didDismissEditor) {
                        RecipeEditor(config: $recipeEditorConfig)
                    }
                }
            }
    }
    
    private func didDismissEditor() {
        if recipeEditorConfig.shouldSaveChanges {
            if recipeEditorConfig.recipe.isNew {
                selection = recipeBox.add(recipeEditorConfig.recipe)
            } else {
                recipeBox.update(recipeEditorConfig.recipe)
            }
        }
    }
}

