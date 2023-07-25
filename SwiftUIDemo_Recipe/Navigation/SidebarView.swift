//
//  SidebarItem.swift
//  SwiftUIDemo_Recipe
//
//  Created by DaKing on 2023/7/21.
//

import SwiftUI

enum SidebarItem: Hashable {
    case all, favorite, recents
    case collection(String)
    var title: String {
        switch self {
        case .all:
            return "All Recipes"
        case .favorite:
            return "Favorites"
        case .recents:
            return "Recents"
        case .collection(let name):
            return name
        }
    }
}

struct SidebarView: View {
    @Binding var selection: SidebarItem?
    @ObservedObject var recipeBox: RecipeBox
    
    var body: some View {
        List(selection: $selection) {
            Section("Library") {
                NavigationLink(value: SidebarItem.all) {
                    Text(SidebarItem.all.title)
                }
                NavigationLink(value: SidebarItem.favorite) {
                    Text(SidebarItem.favorite.title)
                }
                NavigationLink(value: SidebarItem.recents) {
                    Text(SidebarItem.recents.title)
                }
            }
            
            Section("Collections") {
                ForEach(recipeBox.collections, id: \.self) { collectionName in
                    NavigationLink(value: SidebarItem.collection(collectionName)) {
                        Text(collectionName)
                    }
                }
            }
        }
    }
}
