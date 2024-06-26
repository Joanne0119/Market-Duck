//
//  MapView.swift
//  Market Duck
//
//  Created by 劉丞恩 on 2024/6/24.
//

import SwiftUI
import CoreLocation

struct MapView: View {
    @State private var boatOffsetX: CGFloat = 100
    @State private var boatOffsetY: CGFloat = 180
    @State private var fishOffset: CGFloat = -120
    @State private var fishRoate: CGFloat = 10
    @State private var fish2OffsetX: CGFloat = -110
    @State private var fish2OffsetY: CGFloat = 150
    @State private var boateRoate: CGFloat = 0
    
    @State private var totalDistance: CLLocationDistance = 0.0
    @ObservedObject var markets: MarketData
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                Color("ocean_color")
                    .ignoresSafeArea()
                Image("taiwan")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 277)
                    .offset(x: 20, y: -10)
                Image("fish")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160)
                    .offset(x: -120, y: fishOffset)
                    .rotationEffect(.degrees(fishRoate))
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 6.5).repeatForever(autoreverses: true)) {
                            fishOffset = -110
                            fishRoate = 0
                        }
                    }
                Image("fish 2")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .offset(x: fish2OffsetX, y: fish2OffsetY)
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                            fish2OffsetX = -100
                            fish2OffsetY = 160
                        }
                    }
                Image("taiwan_text")
                    .resizable()
                    .scaledToFit()
                    .offset(x: -100, y: -300)
                    .frame(width: 112)
                Image("boat")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 99)
                    .offset(x: boatOffsetX, y: boatOffsetY)
                    .rotationEffect(.degrees(boateRoate))
                    .onAppear() {
                        withAnimation(.easeInOut(duration: 4).repeatForever(autoreverses: true)) {
                            boatOffsetX = 50
                            boatOffsetY = 210
                            boateRoate = -10
                        }
                    }
                NavigationLink{
                    AreaView(initialLocation: CLLocationCoordinate2D(latitude: 25.0330, longitude: 121.5480),initZoom: 12.0, markets: markets)
                        .ignoresSafeArea()
                }label:{
                    HStack{
                        Image("location_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("台北")
                            .foregroundStyle(Color("map_text_color"))
                            .font(.system(size: 15, weight: .bold))
                    }
                    
                }
                .offset(x: 117, y: -243)
                NavigationLink{
                    AreaView(initialLocation: CLLocationCoordinate2D(latitude: 25.0489, longitude: 121.4535), initZoom: 12, markets: markets)
                        .ignoresSafeArea()
                }label: {
                    HStack{
                        Image("location_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                        Text("新北")
                            .foregroundStyle(Color("map_text_color"))
                            .font(.system(size: 15, weight: .bold))
        
                    }
                    
                }
                .offset(x: 108, y: -198)
                NavigationLink{
                    AreaView(initialLocation: CLLocationCoordinate2D(latitude: 24.9986, longitude: 121.2754), initZoom: 11.3, markets: markets)
                        .ignoresSafeArea()
                }label: {
                    HStack{
                        Text("桃園")
                            .foregroundStyle(Color("map_text_color"))
                            .font(.system(size: 15, weight: .bold))
                        Image("location_icon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 20)
                    }
                    
                }
                .offset(x: 30, y: -218)
                
            }
        }
        
    }
}

#Preview {
    ContentView()
}

