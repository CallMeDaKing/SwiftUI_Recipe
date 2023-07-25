//
//  RecipeListItemView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

struct RecipeListItemView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack {
            recipe.smallImage
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(4)
            VStack {
                Text(recipe.title).font(.title3)
                Text(recipe.subtitle).font(.caption)
            }
            Spacer()
            
            if recipe.isFavorite {
                Image(systemName: "heart").symbolVariant(.fill)
            }
        }
    }
}
