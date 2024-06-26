//
//  HomeView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/20.
//

import SwiftUI
let eventCarousel = [ "mk01",
                    "mk02",
                    "mk03",
                    "mk04",
                    "mk05"]

struct HomeView: View {
    @ObservedObject var markets: MarketData
    var body: some View {
        NavigationStack{
            ZStack{
                Color("background_color")
                    .ignoresSafeArea()
                ScrollView{
                    CarouselView()
                    CatergoryButtons()
                        .padding(.horizontal, 40)
                    CardView(title: "最近瀏覽", markets: markets)
                    CardView(title: "你可能有興趣", markets: markets)
                    CardView(title: "熱門市集", markets: markets)
                        .padding(.bottom, 120)
                    
                }
                .navigationTitle("Market Duck")
            }
        }
        
        
    }
}

struct CarouselView: View {
    @State private var currentPage = 0
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(eventCarousel.indices, id: \.self) { index in
                    Image(eventCarousel[index])
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 334, height: 174)
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .overlay {
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color("line_color"), lineWidth: 3)
                        }
                        .padding(.horizontal, 30)
                        .padding(.vertical)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .frame(height: 200)
            
            HStack(spacing: 8) {
                ForEach(eventCarousel.indices, id: \.self) { index in
                    Circle()
                        .stroke(Color("line_color"), lineWidth: 1.5)
                        .fill(index == currentPage ? Color.black : Color("background"))
                        .frame(width: 5, height: 5)
                }
            }
            .padding(.bottom)
        }
    }
}

struct CatergoryButtons: View{
    var body: some View {
        HStack{
            CatergoryButton(buttonImage: "cultural_creative_button", buttonName: "文創")
            Spacer()
            CatergoryButton(buttonImage: "food_button", buttonName: "美食")
            Spacer()
            CatergoryButton(buttonImage: "festival_button", buttonName: "節慶")
            Spacer()
            CatergoryButton(buttonImage: "secondhand_button", buttonName: "二手")
        }
        HStack{
            CatergoryButton(buttonImage: "art_button", buttonName: "藝術")
            Spacer()
            CatergoryButton(buttonImage: "pet_button", buttonName: "寵物")
            Spacer()
            CatergoryButton(buttonImage: "music_button", buttonName: "音樂")
            Spacer()
            CatergoryButton(buttonImage: "farm_button", buttonName: "小農")
        }
    }
}

struct CatergoryButton: View{
    var buttonImage: String
    var buttonName: String
    var body: some View {
        Button(action: {
            
        }){
            VStack{
                Image(buttonImage)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 56, height: 56)
                Text(buttonName)
                    .foregroundStyle(.black)
                    .font(.system(size: 15, weight: .regular))
            }
        }
    }
}

struct CardView: View{
    var title: String
    @ObservedObject var markets: MarketData
    var body: some View {
        VStack(alignment:.leading){
            Spacer()
            Text(title)
                .padding(.top, 20)
                .padding(.horizontal, 30)
                .font(.system(size: 20, weight: .bold))
                
            ScrollView(.horizontal){
                LazyHStack(spacing: 0) {
                    ForEach(markets.markets, id: \.self) { item in
                        Card(market: item)
                            
                    }
                }
            }
            .scrollTargetBehavior(.paging)
            .scrollIndicators(.hidden)
        }
    }
}

struct Card: View {
    @StateObject var market: Market
    var body: some View {
        NavigationLink{
            InfoView(market: market)
        }label: {
            VStack{
                Image(market.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 125, height: 68)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .overlay{
                        RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color("line_color"), lineWidth: 2)
                    }
                    .overlay(alignment: .topTrailing){
                        Button(action: {
                            market.isFavorite.toggle()
                        }){
                            Image(market.isFavorite ? "heart_save_button_selected" :"heart_save_button")
                                .resizable()
                                .scaledToFit()
                                .frame(width:24, height:19)
                                .padding(3)
                        }
                    }
                    .padding(.leading, 20)
                    .padding(.vertical, 5)
                Text(market.name)
                    .font(.system(size: 16, weight: .medium))
                    .frame(width: 120, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading)
                    .foregroundStyle(.black)
                Text(market.location)
                    .font(.system(size: 12, weight: .regular))
                    .frame(width: 120, alignment: .leading)
                    .lineLimit(1)
                    .padding(.leading)
                    .foregroundStyle(.black)
                
            }
        }
        
    }
}

#Preview {
   ContentView()
}
