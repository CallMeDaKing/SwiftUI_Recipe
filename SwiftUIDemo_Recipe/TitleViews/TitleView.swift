//
//  TitleView.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/24.
//

import SwiftUI

struct TitleView: View {
    #if os(iOS)
    @Environment(\.horizontalSizeClass) private var horizontalSizeClass
    #endif
    @Binding var recipe: Recipe
    
    var body: some View {
        HStack {
            #if os(iOS)
            switch horizontalSizeClass {
            case .compact:
                CompactTitleView(recipe: $recipe)
            default:
                RegularTitleView(recipe: $recipe)
            }
            #else
            RegularTitleView(recipe: $recipe)
            #endif
        }
        .padding()
        .background(Color.primary.colorInvert().opacity(0.75))
    }
}
