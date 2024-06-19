//
//  ContentView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/19.
//

import SwiftUI

struct ContentView: View {
    enum PageController {
        case login
        case logout
        case home
        case map
        case search
        case save
        case profile
    }
    @State var curPage = PageController.home
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                VStack {
                    Spacer()
                    switch curPage {
                    case .login:
                        Text("login page")
                    case .logout:
                        Text("logout page")
                    case .home:
                        Text("home")
                        HomeView()
                    case .map:
                        Text("map")
                    case .search:
                        Text("search")
                    case .save:
                        Text("save")
                    case .profile:
                        Text("profile")
                    }
                    Spacer()
                    CustomBottomBar(curPage: $curPage)
                        .frame(height: 30)
                        .ignoresSafeArea(edges: .bottom)
                }
                .frame(width: geometry.size.width, height: geometry.size.height)
                .background(Color.white)
            }
        }
    }
}

struct CustomBottomBar: View {
    @Binding var curPage: ContentView.PageController

    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 100)
                .foregroundColor(Color("bottom_bar_color"))
            
            Ellipse()
                .frame(width: 133, height: 117)
                .foregroundColor(Color("bottom_bar_color"))
                .offset(y: -30)
            
            HStack {
                Spacer()
                CustomButton(icon: "map_icon", selectedIcon: "map_icon_selected", page: .map, curPage: $curPage)
                Spacer()
                CustomButton(icon: "search_icon", selectedIcon: "search_icon_selected", page: .search, curPage: $curPage)
                Spacer()
                CustomButton(icon: "home_icon", selectedIcon: "home_icon_selected", page: .home, curPage: $curPage, isLarge: true)
                Spacer()
                CustomButton(icon: "save_icon", selectedIcon: "save_icon_selected", page: .save, curPage: $curPage)
                Spacer()
                CustomButton(icon: "profile_icon", selectedIcon: "profile_icon_selected", page: .profile, curPage: $curPage)
                Spacer()
            }
        }
    }
}

struct CustomButton: View {
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
                .frame(width: isLarge ? 90 : 45, height: isLarge ? (curPage == page ? 90 : 80) : (curPage == page ? 45 : 35))
                .offset(y: isLarge ? -15: 0)
        }
    }
}

#Preview {
    ContentView()
}
