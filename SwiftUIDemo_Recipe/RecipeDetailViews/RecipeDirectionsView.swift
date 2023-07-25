//
//  RecipeDirectionsView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/24.
//

import SwiftUI

struct RecipeDirectionsView: View {
    let recipe: Recipe
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Directions")
                .font(.title3)
                .padding(.bottom)
            Text(recipe.directions)
        }
    }
}
