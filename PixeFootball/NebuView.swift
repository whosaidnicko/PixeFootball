//
//  NebuView.swift
//  PixeFootball
//
//  Created by Nicolae Chivriga on 28/01/2025.
//

import SwiftUI
import StoreKit

struct NebuView: View {
    @State var moveRuling: Bool = false
    var body: some View {
        ZStack {
            Image("bgPe")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: moveRuling ?  3 : 0)
            
            HStack {
                Image("logo")
                
                Spacer()
                
                VStack(spacing: 21) {
                    NavigationLink {
                        PixeliniGol()
                    } label: {
                        ButtonMeniuha(text: "START")
                    }

                   
                    Button {
                        withAnimation {
                            moveRuling = true
                        }
                    } label: {
                        ButtonMeniuha(text: "HOW TO PLAY?")
                    }

                 
                    
                    Button {
                        if let window = UIApplication.shared.windows.first {
                            requestReview(in: window)
                        }
                    } label: {
                        ButtonMeniuha(text: "STARS")
                    }

                    
                }
            }
            .padding(.horizontal)
            .blur(radius: moveRuling ?  3 : 0)
            
            Image("regul")
                .offset(y: moveRuling ? 0 : -UIScreen.main.bounds.height)
        }
        .navigationBarBackButtonHidden()
    
        .onAppear() {
            let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
            impactHeavy.impactOccurred()
        }
        .onTapGesture {
            withAnimation {
                moveRuling = false
            }
        }
    }
    func requestReview(in window: UIWindow?) {
        if let windowScene = window?.windowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}
struct StrokeText: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}
