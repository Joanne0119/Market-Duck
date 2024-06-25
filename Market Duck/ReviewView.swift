//
//  ReviewView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/25.
//

import SwiftUI

struct ReviewView: View {
    var body: some View {
        ZStack {
            Color("background_color")
                .ignoresSafeArea()
            VStack{
                ReviewCard(review: Review(content: "整體非常不錯，逛起來很舒服。", userName: "pp", userImage: "default_profile_photo", score: 4))
            }
            
        }
        .navigationTitle("評論")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct ReviewCard:View {
    let review: Review
    var isInfoView: Bool = false
    var body: some View {
        VStack(alignment:.leading){
            HStack {
                VStack(alignment:.leading){
                    HStack(alignment:.top){
                        Image(review.userImage)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50)
                            .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                            .overlay{
                                Circle()
                                    .stroke(Color("line_color"), lineWidth: 2)
                            }
                            .padding(.trailing)
                        VStack(alignment:.leading){
                            Text(review.userName)
                                .font(.system(size: 20, weight: .medium))
                            Text(review.time)
                                .font(.system(size: 10))
                                .foregroundStyle(Color("line_color"))
                        }
                    }
                    Text(review.content)
                        .frame(width: 240)
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                    
                }
                Spacer()
            }
            
        }
        .frame(width: 300)
        .padding(20)
        .padding(.bottom, 10)
        .background(isInfoView ? .clear : .white)
        .overlay(alignment:.bottomTrailing){
            HStack{
                Image("score_full")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 18)
                    .offset(x: 8)
                Text(String(review.score))
            }
            .padding(.horizontal, 10)
            .padding(.vertical, 6)
        }
        .overlay{
            RoundedRectangle(cornerRadius: 10)
                .stroke(isInfoView ? Color("line_color") : Color("trending_block_color"), lineWidth: 2)
        }
    }
}

#Preview {
    ReviewView()
}
