//
//  CompactTitleView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/24.
//

import SwiftUI

struct CompactTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        Spacer()
        VStack {
            Text(recipe.title)
                .font(.title2)
            StarRating(rating: $recipe.rating)
            Text(recipe.subtitle)
                .font(.subheadline)
        }
        Spacer()
    }
}

