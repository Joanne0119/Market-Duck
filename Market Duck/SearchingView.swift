//
//  SearchingView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct SearchingView: View{
    @State private var message: String = ""
    @FocusState var isMessageFocus: Bool
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ZStack(alignment:.top) {
            Color("background_color")
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                HStack{
                    TextField(
                        "二手市集、中山......",
                        text: $message,
                        axis: .vertical
                    )
                    .focused($isMessageFocus)
                    Spacer()
                    Button{
                        print("search")
                    }label: {
                        Image("search_bar_icon")
                            .frame(width: 28)
                    }
                    
                    
                            
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 6)
                .overlay {
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color("line_color"), lineWidth: 3)
                    
                }
                .background(.white)
                
                
                Text("熱門搜尋")
                    .font(.system(size: 26, weight: .bold))
                    .padding(.top, 20)
                TrendingBlock(title: "開村大喜", place: "新北")
                TrendingBlock(title: "Chill High High 城市野營市集", place: "台北")
                TrendingBlock(title: "夏日野餐音樂市集", place: "台北")
                
            }
            .padding(.horizontal, 35)
            .padding(.vertical, 5)
            .onTapGesture {
                isMessageFocus = false
            }
              
        }
    }
}

struct TrendingBlock: View {
    var title: String
    var place: String
    var body: some View {
        HStack(alignment: .center) {
            Text(title + "    ")
                .font(.system(size: 15, weight: .regular))
                .foregroundStyle(Color.black)
            Text(place)
                .font(.system(size: 11, weight: .regular))
                .foregroundStyle(Color("line_color"))
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 15)
        .background(Color("trending_block_color"))
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

#Preview {
    SearchingView()
}
