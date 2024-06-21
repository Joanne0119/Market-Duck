//
//  MembershipView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct MembershipView: View {
    var body: some View {
        
        ZStack(alignment: .top) {
            Color("background_color")
                .ignoresSafeArea()
            VStack{
                Image("membership_banner")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 381)
                    .overlay(alignment: .topLeading){
                        Text("見習小鴨")
                            .font(.system(size: 24,weight: .bold))
                            .offset(x:80, y: 80)
                    }
                Experience(experience: 3650)
                    .padding(.bottom, 30)
                Text("小鴨會員禮遇")
                    .font(.system(size: 20,weight: .bold))
                NavigationLink{
                    
                }label: {
                    Text("指定市集八折優惠券")
                        .foregroundStyle(.white)
                        .font(.system(size: 19, weight: .regular))
                        .frame(width: 262, height: 34)
                        .background(Color("membership_color"))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(.vertical, 5)
                NavigationLink{
                    
                }label: {
                    Text("會員生日禮")
                        .foregroundStyle(.white)
                        .font(.system(size: 19, weight: .regular))
                        .frame(width: 262, height: 34)
                        .background(Color("membership_color"))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(.vertical, 5)
                NavigationLink{
                    
                }label: {
                    Text("經驗值加倍賺")
                        .foregroundStyle(.white)
                        .font(.system(size: 19, weight: .regular))
                        .frame(width: 262, height: 34)
                        .background(Color("membership_color"))
                        .clipShape(RoundedRectangle(cornerRadius: 24))
                }
                .padding(.vertical, 5)
                NavigationLink{
                    
                }label: {
                    Text("如何賺取經驗值?")
                        .foregroundStyle(Color("line_color"))
                        .font(.system(size: 15, weight: .light))
                        
                }
                .padding(.vertical, 8)
                                    
            }
            
        }
        .navigationTitle("我的會員")
    }
}

struct Experience: View {
    @State var experience: Int
    @State private var expWidth: CGFloat = 0
    var body: some View {
        VStack(alignment: .leading){
            Text(String(experience) + " / 5000")
                .font(.system(size: 13))
            RoundedRectangle(cornerRadius: 10)
                .fill(Color("trending_block_color"))
                .frame(width: 279, height: 21)
                .overlay(alignment: .leading){
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color("label_color"))
                        .frame(width: expWidth, height: 21)
                }
                .onAppear{
                    withAnimation(.spring(duration: 0.8,bounce: 0.3).delay(0.5).speed(1.1)){
                        self.expWidth = CGFloat(experience * 279/5000)
                    }
                }
        }
    }
}

#Preview {
    NavigationStack{
        MembershipView()
    }
}
