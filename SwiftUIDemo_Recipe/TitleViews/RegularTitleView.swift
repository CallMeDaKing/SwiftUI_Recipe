//
//  RegularTitleView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/24.
//

import SwiftUI

struct RegularTitleView: View {
    @Binding var recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(recipe.title)
                .font(.largeTitle)
            StarRating(rating: $recipe.rating)
        }
        Spacer()
        Text(recipe.subtitle)
            .font(.subheadline)
    }
}

