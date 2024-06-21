//
//  BottomBar.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/20.
//
import SwiftUI

struct BottomBar: View {
    @Binding var curPage: ContentView.PageController

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 110)
                .foregroundColor(Color("bottom_bar_color"))
            
            Ellipse()
                .frame(width: 133, height: 117)
                .foregroundColor(Color("bottom_bar_color"))
                .offset(y: -30)
            
            HStack {
                Spacer()
                BottomBarButton(icon: "map_icon", selectedIcon: "map_icon_selected", page: .map, curPage: $curPage)
                Spacer()
                BottomBarButton(icon: "search_icon", selectedIcon: "search_icon_selected", page: .search, curPage: $curPage)
                Spacer()
                BottomBarButton(icon: "home_icon", selectedIcon: "home_icon_selected", page: .home, curPage: $curPage, isLarge: true)
                Spacer()
                BottomBarButton(icon: "favorite_icon", selectedIcon: "favorite_icon_selected", page: .favorite, curPage: $curPage)
                Spacer()
                BottomBarButton(icon: "profile_icon", selectedIcon: "profile_icon_selected", page: .profile, curPage: $curPage)
                Spacer()
            }
        }
    }
}

struct BottomBarButton: View {
    var icon: String
    var selectedIcon: String
    var page: ContentView.PageController
    @Binding var curPage: ContentView.PageController
    var isLarge: Bool = false

    var body: some View {
        Button(action: {
            curPage = page
        }) {
            Image(curPage == page ? selectedIcon : icon)
                .resizable()
                .scaledToFit()
                .frame(width: isLarge ? 90 : 45, height: isLarge ? (curPage == page ? 90 : 80) : (curPage == page ? 48 : 40))
                .offset(y: isLarge ? -25: -10)
        }
    }
}

#Preview {
    ContentView()
}
