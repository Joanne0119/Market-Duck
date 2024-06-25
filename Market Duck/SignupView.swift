//
//  SignupView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct SignupView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var name: String = ""
    @State private var gender: Bool = true //true->boy, false->girl
    @State private var birthday = Date()
    @State private var isSecured: Bool = false
    @FocusState var isEmailFocus: Bool
    @FocusState var isPasswordFocus: Bool
    @FocusState var isNameFocus: Bool
    @State var isGenderFocus: Bool = false
    @State private var isSelectedGender: Bool = false
    var page: ContentView.PageController
    @Binding var curPage: ContentView.PageController

    var body: some View {
        ZStack(alignment:.top){
            Color("background_color")
                .ignoresSafeArea()
            VStack(alignment:.center){
                ZStack {
                    Circle()
                        .frame(width: 140)
                        .foregroundStyle(.white)
                    Image("app_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                }
                VStack{
                    HStack{
                        Text("姓名")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 18))
                        VStack{
                            TextField(
                                "姓名",
                                text: $name,
                                axis: .vertical
                            )
                            .focused($isNameFocus)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(isNameFocus ? .black : Color("trending_block_color"))
                                
                        }
                        .padding(.leading)
                        
                    }
                    Spacer()
                    HStack{
                        Text("性別")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 18))
                        VStack{
                            Button{
                                isSelectedGender = true
                            }label: {
                                HStack{
                                    Text(gender ? "男生" : "女生")
                                        .foregroundStyle(.black)
                                    Spacer()
                                    Image(systemName: "chevron.down")
                                        .foregroundStyle(.black)
                                }
                                
                            }
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(isGenderFocus ? .black : Color("trending_block_color"))
                                
                        }
                        .padding(.leading)
                    }
                    Spacer()
                    
                    HStack{
                        Text("生日")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 18))
                        VStack{
                            DatePicker("", selection: $birthday, displayedComponents: .date)
                                .offset(x: -100)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(Color("trending_block_color"))
                                
                        }
                        .padding(.leading)
                        
                    }
                    
                    Spacer()
                    HStack{
                        Text("信箱")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 18))
                        VStack{
                            TextField(
                                "電子郵件",
                                text: $account,
                                axis: .vertical
                            )
                            .focused($isEmailFocus)
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(isEmailFocus ? .black : Color("trending_block_color"))
                                
                        }
                        .padding(.leading)
                        
                    }
                    
                    Spacer()
                
                    HStack{
                        Text("密碼")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 18))
                        VStack{
                            HStack{
                                if isSecured {
                                    SecureField("8位以上的英文數字", text: $password)
                                        .focused($isPasswordFocus)
                                } else {
                                    TextField("8位以上的英文數字", text: $password)
                                        .focused($isPasswordFocus)
                                }
                                
                                Button(action: {
                                    isSecured.toggle()
                                }) {
                                    Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                        .accentColor(Color("line_color"))
                                }
                            }
                            
                            Rectangle()
                                .frame(height: 2)
                                .foregroundStyle(isPasswordFocus ? .black : Color("trending_block_color"))
                        }
                        .padding(.leading)
                        
                    }
                    
                    Spacer()
                    
                    Button{
                        curPage = page
                    }label: {
                        Text("註冊")
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .regular))
                            .frame(width: 147, height: 34)
                            .background(Color("label_color"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, 50)
                .padding(.vertical)
                .frame(height: 360)
                
                Spacer()
                
            }
            

        }
        
        .overlay(alignment: .center){
            if isSelectedGender {
                ZStack {
                    Button{
                        isSelectedGender = false
                    }label: {
                        Color("line_color")
                            .ignoresSafeArea()
                            .opacity(0.7)
                    }
                    
                    VStack{
                        Text("選擇你的性別")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                            .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.white)
                            .padding(.bottom, 40)
                        
                        HStack{
                            Button{
                                gender = false
                                isSelectedGender = false
                            }label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 141)
                                        .foregroundStyle(Color("background_color 2"))
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    Image("female_duck")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 101)
                                }
                            }
                            
                            Spacer()
                            Button{
                                gender = true
                                isSelectedGender = false
                            }label: {
                                ZStack {
                                    Circle()
                                        .frame(width: 141)
                                        .foregroundStyle(Color("background_color 2"))
                                        .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                    Image("male_duck")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 101)
                                }
                            }
                        }
                        .padding(.horizontal, 40)
                        
                    }
                    
                }
            }
            
        }
    }
}
