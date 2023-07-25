//
//  RecipeEditorConfig.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

struct RecipeEditorConfig {
    var recipe = Recipe.emptyRecipe()
    var shouldSaveChanges = false
    var isPressented = false
    
    mutating func presentAddRecipe(sidebarItem: SidebarItem) {
        recipe = Recipe.emptyRecipe()
        
        switch sidebarItem {
        case .favorite:
            recipe.isFavorite = true
        case .collection(let name):
            recipe.collections = [name]
        default:
            break
        }
        shouldSaveChanges = false
        isPressented = true
    }
    
    mutating func presentEditRecipe(_ recipeToEdit: Recipe) {
        recipe = recipeToEdit
        shouldSaveChanges = false
        isPressented = true
    }
    
    mutating func done() {
        shouldSaveChanges = true
        isPressented = false
    }
    
    mutating func cancel() {
        shouldSaveChanges = false
        isPressented = false
    }
}
