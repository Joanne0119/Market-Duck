//
//  HomeView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/20.
//

import SwiftUI
let eventCarousel = [ "Ad",
                    "Ad",
                    "Ad",
                    "Ad",]

struct HomeView: View {
    var body: some View {
        NavigationStack{
            VStack{
                CarouselView()
                CatergoryButtons()
                    .padding(.horizontal, 40)
                
            }
            .navigationTitle("Market Duck")
        }
        
    }
}

struct CarouselView: View {
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack(spacing: 0) {
                ForEach(eventCarousel, id: \.self) { ad in
                    Image(ad)
                        .padding(.horizontal, 30)

                }
            }
        }
        .scrollTargetBehavior(.paging)
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
                    .frame(width: 57, height: 57)
                Text(buttonName)
                    .foregroundStyle(.black)
                    .font(.system(size: 15, weight: .regular))
            }
        }
    }
}

#Preview {
    HomeView()
}
