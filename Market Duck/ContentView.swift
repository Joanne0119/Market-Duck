//
//  ContentView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/19.
//

import SwiftUI
import GoogleMaps

struct ContentView: View {
    enum PageController {
        case login
        case home
        case map
        case search
        case favorite
        case profile
    }
    @State var curPage = PageController.login
    @State private var totalDistance: CLLocationDistance = 0.0
    @StateObject var marketData = MarketData()
    
    
    var body: some View {
        ZStack {
            Color("background_color")
                .ignoresSafeArea()
            VStack {
                Spacer()
                switch curPage {
                case .login:
                    LoginView(page: .home, curPage: $curPage)
                case .home:
                    HomeView(markets: marketData)
                    BottomBar(curPage: $curPage)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .bottom)
                case .map:
                    MapView(markets: marketData)
                    BottomBar(curPage: $curPage)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .bottom)
                case .search:
                    SearchView(markets: marketData)
                    BottomBar(curPage: $curPage)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .bottom)
                case .favorite:
                    FavoriteView(markets: marketData)
                    BottomBar(curPage: $curPage)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .bottom)
                case .profile:
                    ProfileView(page: .login, curPage: $curPage)
                    BottomBar(curPage: $curPage)
                        .frame(height: 100)
                        .ignoresSafeArea(edges: .bottom)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea()
            
            
        }
        
    }
}


#Preview {
    ContentView()
}
