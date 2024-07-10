//
//  ProfileView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct ProfileView: View {
    var page: ContentView.PageController
    @Binding var curPage: ContentView.PageController
    var body: some View {
        NavigationStack{
            ZStack(alignment: .top) {
                Color("background_color")
                    .ignoresSafeArea()
                VStack(alignment: .leading){
                    ProfileSection()
                    
                    VStack(alignment: .leading){
                        NavigationLink{
                            MembershipView()
                        }label: {
                            HStack{
                                Image(systemName: "medal")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("我的會員")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                        NavigationLink{
                            
                        }label: {
                            HStack{
                                Image(systemName: "bell")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("通知信箱")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                        NavigationLink{
                           
                        }label: {
                            HStack{
                                Image(systemName: "gift")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("優惠活動")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                        NavigationLink{
                            
                        }label: {
                            HStack{
                                Image(systemName: "gearshape")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("設定")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 10)
                    
                    Rectangle()
                        .frame(height:2)
                        
                    VStack(alignment: .leading){
                        NavigationLink{
                            
                        }label: {
                            HStack{
                                Image(systemName: "questionmark.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("常見問題與幫助")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                        NavigationLink{
                            
                        }label: {
                            HStack{
                                Image(systemName: "info.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(.black)
                                    .frame(width: 20)
                                Text("關於Market Duck")
                                    .foregroundStyle(.black)
                                    .font(.system(size: 19, weight: .regular))
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .padding(.horizontal, 50)
                    .padding(.vertical, 20)
                    HStack{
                        Spacer()
                        Button{
                            curPage = page
                        }label: {
                            HStack{
                                Text("登出/登入")
                                    .foregroundStyle(Color("line_color"))
                                    .font(.system(size: 19, weight: .regular))
                                Image(systemName: "rectangle.portrait.and.arrow.forward")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundStyle(Color("line_color"))
                                    .frame(width: 20)
                            }
                            .padding(.vertical, 5)
                            .padding(.trailing, 18)
                        }
                    }
                    
                }
                
                
            }
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button{
                        print("edit")
                    }label: {
                        Text("編輯")
                    }
                }
            }
        }
    }
}

struct ProfileSection: View {
    
    var body: some View {
        ZStack {
            Color("background_color 2")
                .opacity(0.65)
                .ignoresSafeArea()
                .frame(height: 227)
            VStack{
                Image("default_profile_photo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 107)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Text("鴨賞大王")
                    .font(.system(size: 29,weight: .bold))
                    .padding(.vertical, 3)
                Text("見習小鴨")
                    .font(.system(size: 13,weight: .regular))
                    .foregroundStyle(.blue)
            }
        }
        Rectangle()
            .frame(height:2)
            .offset(y: -10)
    }
}

#Preview {
    ContentView()
}
