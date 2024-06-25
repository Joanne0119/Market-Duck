//
//  LaunchScreenView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/25.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isActive = false
    @State private var width = 250.0
    @State private var opacity = 1.0
    
    var body: some View {
        if isActive {
            ContentView()
        } else{
            ZStack{
                Color("background_color")
                    .ignoresSafeArea()
                Image("launch_app_logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)
                    .onAppear{
                        withAnimation(.linear(duration: 2).delay(1.5)){
                            self.opacity = 0
                        }
                        withAnimation(.linear(duration: 2).delay(0.5)){
                            self.width = 280
                        }
                    }
            }
            .opacity(opacity)
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.5){
                    self.isActive = true
                }
            }
        }
    }
}

#Preview {
    LaunchScreenView()
}
