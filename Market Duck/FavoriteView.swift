//
//  FavoriteView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct FavoriteView: View {
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                Color("background_color")
                    .ignoresSafeArea()
                LazyVGrid(columns: columns, spacing: 20) {
                    ForEach(eventCard, id: \.self) { item in
                        FavoriteCard(item: item)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 20)
            }
            .navigationTitle("我的市集")
        }
       
    }
}

struct FavoriteCard: View {
    var item: String
    @State var isSave: Bool = true
    @State var isEnd: Bool = true
    var body: some View {
        Image(item)
            .resizable()
            .scaledToFill()
            .frame(width: 144, height: 144)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .overlay{
                ZStack{
                    RoundedRectangle(cornerRadius: 10)
                        .fill(isEnd ? Color("trending_block_color").opacity(0.8) : .clear)
                    Circle()
                        .frame(width: 62)
                        .foregroundStyle(Color("line_color"))
                    Text("已結束")
                        .foregroundStyle(.white)
                }
                
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color("line_color"), lineWidth: 2)
            }
            .overlay(alignment: .bottomLeading){
                Text("地區地區")
                    .font(.system(size: 12, weight: .regular))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 5)
                    .frame(height: 25, alignment: .center)
                    .background(Color("label_color"))
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .offset(x: -6, y: -5)
                    .shadow(radius: 4)
            }
            .overlay(alignment: .topTrailing) {
                Button(action: {
                    isSave.toggle()
                }) {
                    Image(isSave ? "favorite_heart_icon_selected" : "favorite_heart_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 28)
                        .padding(3)
                }
                .padding(.trailing, 10)
                .padding(.top, 10)
                
            }
            
            
        
        
    }
}

#Preview {
    FavoriteView()
}
