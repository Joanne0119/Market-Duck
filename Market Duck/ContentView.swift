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
        case favorite
        case profile
    }
    @State var curPage = PageController.home
    
    var body: some View {
        ZStack {
            Color("background_color")
                .ignoresSafeArea()
            VStack {
                Spacer()
                switch curPage {
                case .login:
                    Text("login page")
                case .logout:
                    Text("logout page")
                case .home:
                    HomeView()
                case .map:
                    Text("map")
                case .search:
                    SearchView()
                case .favorite:
                    FavoriteView()
                case .profile:
                    ProfileView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            VStack {
                Spacer()
                BottomBar(curPage: $curPage)
                    .frame(height: 100)
            }
            .ignoresSafeArea(edges: .bottom)
        }
        
    }
}


#Preview {
    ContentView()
}
