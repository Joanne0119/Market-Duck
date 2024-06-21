//
//  LoginView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/21.
//

import SwiftUI

struct LoginView: View {
    @State private var account: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = false
    @FocusState var isEmailFocus: Bool
    @FocusState var isPasswordFocus: Bool
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
                .padding(.top, 50)
                
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
                        .padding(.bottom, 40)
                
                    HStack{
                        if isSecured {
                            SecureField("密碼", text: $password)
                                .focused($isPasswordFocus)
                        } else {
                            TextField("密碼", text: $password)
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
                    HStack {
                        Spacer()
                        Button{
                            
                        }label: {
                            Text("忘記密碼?")
                                .font(.system(size: 13))
                                .foregroundStyle(Color("line_color"))
                        }
                        .padding(.vertical, 8)
                    }
                    
                    NavigationLink{
                        
                    }label: {
                        Text("登入")
                            .foregroundStyle(.white)
                            .font(.system(size: 19, weight: .regular))
                            .frame(width: 262, height: 34)
                            .background(Color("label_color"))
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .padding(.vertical, 5)
                    NavigationLink{
                        
                    }label: {
                        Text("註冊")
                            .foregroundStyle(Color("line_color"))
                            .font(.system(size: 19, weight: .regular))
                            .frame(width: 262, height: 34)
                            .overlay{
                                RoundedRectangle(cornerRadius: 8)
                                                .stroke(Color("line_color"), lineWidth: 1)
                            }
                    }
                    .padding(.vertical, 5)
                }
                .padding(.horizontal, 50)
                .frame(height: 280)
                
                Rectangle()
                    .frame(height: 1)
                    .foregroundStyle(Color("line_color"))
                    .overlay{
                        Text("或")
                            .padding(.horizontal, 6)
                            .background(Color("background_color"))
                        
                    }
                    .padding(.top, 30)
                HStack{
                    Image("fb_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40)
                        .padding(.horizontal, 8)
                    Image("google_icon")
                        .resizable()
                        .scaledToFit()
                        .frame(width:40)
                        .padding(.horizontal, 8)
                }
                .padding(30)
                Button{
                    
                }label: {
                    Text("訪客登入")
                        .foregroundStyle(Color("line_color"))
                        .underline()
                }
                Spacer()
            }
            

        }
    }
}

#Preview {
    LoginView()
}
