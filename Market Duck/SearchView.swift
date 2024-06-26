//
//  SearchView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/20.
//

import SwiftUI

struct SearchView: View {
    @ObservedObject var markets: MarketData
    var body: some View {
        NavigationStack{
            ZStack{
                Color("background_color")
                    .ignoresSafeArea()
                VStack{
                    SearchBar()
                    ScrollView{
                        SearchCardView(markets: markets)
                            .padding(.bottom, 150)
                    }
                }
            }
            
        }
        
    }
}

struct SearchBar: View {
    @State private var isSelect: Bool = false
    var body: some View {
        VStack{
            NavigationLink {
                SearchingView()
            }
            label: {
                
//                TextField(
//                    "搜尋",
//                    text: $message,
//                    axis: .vertical
//                )
//                
//                .focused($isMessageFocus)
                Spacer()
                Image("search_bar_icon")
                    .frame(width: 28)
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .overlay {
                RoundedRectangle(cornerRadius: 50)
                    .stroke(Color("line_color"), lineWidth: 3)
                    .frame(width: 300)
                    
            }
            .background(.white)
            
            
            HStack{
                HStack{
                    Button {
                        print("推薦")
                    } label: {
                        Text("推薦")
                            .font(.system(size: isSelect ? 18 : 16, weight: isSelect ? .bold : .regular))
                            .foregroundStyle(isSelect ? Color("label_color") : Color.black)
                    }
                    Rectangle()
                        .frame(width: 2, height: 24)
                    Button {
                        print("最新")
                    } label: {
                        Text("最新")
                            .font(.system(size: isSelect ? 18 : 16, weight: isSelect ? .bold : .regular))
                            .foregroundStyle(isSelect ? Color("label_color") : Color.black)
                    }
                    Rectangle()
                        .frame(width: 2, height: 24)
                    Button {
                        print("熱門")
                    } label: {
                        Text("熱門")
                            .font(.system(size: isSelect ? 18 : 16, weight: isSelect ? .bold : .regular))
                            .foregroundStyle(isSelect ? Color("label_color") : Color.black)
                    }
                }
                Spacer()
                Button{
                    print("filter")
                }label: {
                    Image("filter_icon")
                }
                
            }
            .padding(.vertical, 5)
            
        }
        .padding(.horizontal, 40)
        .padding(.vertical, 15)
    }
}


struct SearchCardView: View{
    @ObservedObject var markets: MarketData
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        LazyVGrid(columns: columns, spacing: 20) {
            ForEach(markets.markets, id: \.self) { item in
                SearchCard(market: item, markets: markets)
            }
        }
        .padding(.horizontal, 20)
    }
}

struct SearchCard: View {
    @StateObject var market: Market
    @ObservedObject var markets: MarketData
    var body: some View {
        NavigationLink{
            InfoView(market: market, markets: markets)
        }label: {
            VStack(alignment: .leading) {
                Image(market.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 144, height: 144)
                    .clipShape(RoundedRectangle(cornerRadius: 10))

                
                VStack(alignment: .leading, spacing: 4) {
                    Text(market.name)
                        .font(.system(size: 16, weight: .regular))
                        .lineLimit(1)
                        .frame(width: 120, alignment: .leading)
                        .foregroundStyle(.black)
                    
                    Text("\(market.startDate)-\(market.endDate)")
                        .font(.system(size: 9, weight: .regular))
                        .lineLimit(1)
                        .frame(width: 120, alignment: .leading)
                        .foregroundStyle(.black)
                    
                    Text(market.mrt)
                        .font(.system(size: 9, weight: .regular))
                        .foregroundStyle(.white)
                        .padding(.horizontal, 5)
                        .frame(height: 14, alignment: .center)
                        .background(Color(market.mrtline))
                        .clipShape(RoundedRectangle(cornerRadius: 2))
                }
                .padding(.horizontal, 12)
                .padding(.top, 5)
                .padding(.bottom, 16)
                .background(
                    Button(action: {
                        market.isFavorite.toggle()
                    }) {
                        Image(market.isFavorite ? "heart_save_button_selected" : "heart_save_button")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 24, height: 19)
                            .padding(3)
                    }
                    .padding(.trailing, 10)
                    .padding(.bottom, 10),
                    alignment: .bottomTrailing
                )
                .background(.white)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("line_color"), lineWidth: 2)
            }
            .overlay(alignment: .leading){
                Text(market.location)
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 5)
                    .frame(height: 25, alignment: .center)
                    .background(Color("label_color"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .offset(x: -6, y: 22)
                    .shadow(radius: 4)
            }
        }
    }
}
#Preview {
    ContentView()
}
