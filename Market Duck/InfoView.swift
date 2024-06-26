//
//  InfoView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/25.
//

import SwiftUI
import CoreLocation

struct InfoView: View {
    @ObservedObject var market: Market
    @ObservedObject var markets: MarketData
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ZStack {
            Color("background_color")
                .ignoresSafeArea()
            
            ScrollView{
                Image(market.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 300)
                    .clipped()
                VStack(alignment: .leading){
                    VStack(alignment: .leading){
                        
                        Text("贊助內容")
                            .font(.system(size: 10))
                            .padding(.vertical, 5)
                            .padding(.horizontal, 8)
                            .background(Color(.gray))
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .padding(.leading)
                            .padding(.top)
                        VStack(alignment:.leading){
                            Text(market.name)
                                .font(.system(size: 24, weight: .bold))
                            HStack{
                                ForEach(market.tags, id: \.self) { tag in
                                    Text("#\(tag)")
                                        .font(.system(size: 10))
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 8)
                                        .background(Color("trending_block_color"))
                                        .clipShape(RoundedRectangle(cornerRadius: 5))
                                }
                            }
                            HStack{
                                ScoreView(market: market)
                                Spacer()
                            }
                           
                        }
                        .padding(.leading)
                        
                        
                    }
                    .overlay(alignment: .bottomTrailing){
                        HStack {
                            Button(action: {
                                market.isFavorite.toggle()
                            }) {
                                Image(market.isFavorite ? "favorite_heart_icon_selected" : "favorite_heart_icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 28)
                                    .padding(3)
                            }
                            .padding(.trailing, 10)
                            .padding(.top, 10)
                            ShareLink(item: Image(market.image), preview: SharePreview(market.name, image: Image(market.image))) {
                                Image(systemName: "square.and.arrow.up")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 23)
                                    .foregroundStyle(Color.black)
                                    .padding(3)
                            }
                            .padding(.trailing, 20)
                            .padding(.top, 10)

                        }
                    }
                    VStack(alignment: .leading){
                        Text("市集時間")
                            .font(.title2)
                            .fontWeight(.medium)
                            
                        Text("日期：\(market.startDate)-\(market.endDate)")
                        Text("時間：\(market.time)")
                    }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .padding(.leading)
                   
                    VStack(alignment: .leading) {
                        Text("活動內容")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text(market.info)
                    }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("市集地點")
                            .font(.title2)
                            .fontWeight(.medium)
                        Text(market.location)
                        AreaView(initialLocation: CLLocationCoordinate2D(latitude: market.latitude, longitude: market.longitude),initZoom: 16.0, markets: markets)
                            .frame(width: UIScreen.main.bounds.width-50, height: 300)
                           
                    }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .padding(.leading)
                    
                    VStack(alignment: .leading) {
                        Text("評論")
                            .font(.title2)
                            .fontWeight(.medium)
                        HStack{
                            ForEach(0..<5) { index in
                                Image("score_none")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40)
                            }
                        }
                        HStack{
                            Image("score_full")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                            Text("\(String(market.score)) / 5")
                                .font(.system(size: 20,weight: .medium))
                            Text("(\(market.totalReview)評論)")
                                .font(.system(size: 12))
                        }
                        VStack{
                            ReviewCard(review:  Review(content: "整體非常不錯，逛起來很舒服。", userName: "小鴨鴨", userImage: "default_profile_photo", score: 5), isInfoView: true)
                                .padding(.bottom)
                            NavigationLink {
                                ReviewView()
                            }label: {
                                Text("查看更多評論")
                                    .font(.system(size: 13, weight: .regular))
                                    .foregroundStyle(.black)
                                    .padding(10)
                                    .frame(width: 330)
                            }.overlay{
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color("line_color"), lineWidth: 2)
                            }
                            .padding(.bottom, 40)
                        }
                        
                    }
                    .padding(.top)
                    .padding(.bottom, 30)
                    .padding(.leading)
                    
                }
                .padding(.leading)
            }
            .navigationTitle(market.name)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .topBarLeading){
                    Button{
                        presentationMode.wrappedValue.dismiss()
                        
                    }label: {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.black)
                    }
                }
                
            }
        }
    }
}

struct ScoreView:View {
    let market: Market
    var body: some View {
        HStack {
            ForEach(0..<5) { index in
                if Float(index) < self.market.score {
                    if Float(index + 1) <= self.market.score {
                        Image("score_full")
                            .resizable()
                            .scaledToFit()
                    } else if self.market.score - Float(index) >= 0.5 {
                        Image("score_half")
                            .resizable()
                            .scaledToFit()
                    } else {
                        Image("score_none")
                            .resizable()
                            .scaledToFit()
                    }
                } else {
                    Image("score_none")
                        .resizable()
                        .scaledToFit()
                }
            }
            .frame(height: 24)
            .padding(-3)
            
            Text(String(market.score))
                .font(.system(size: 12))
            Text("(\(market.totalReview) 評論)")
                .font(.system(size: 10))
        }
        .padding(3)
        
    }
}


#Preview {
    ContentView()
}
