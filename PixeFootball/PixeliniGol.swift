//
//  PixeliniGol.swift
//  PixeFootball
//
//  Created by Nicolae Chivriga on 29/01/2025.
//

import SwiftUI
import Lottie


struct PixeliniGol: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Image("bgPe")
                .resizable()
                .ignoresSafeArea()
            
            LottieView(animation: .named("futboliplceovm"))
                .playing(loopMode: .loop)
                .resizable()
                .frame(width: 70, height: 80)
            
            WKWebViewRepresentable(url:
                                    URL(string: "https://plays.org/game/correct-football/")!) {
                let impactHeavy = UIImpactFeedbackGenerator(style: .heavy)
                impactHeavy.impactOccurred()
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarItems(leading:
                                Button(action: {
            dismiss()
        }, label: {
            Image("butoncikb")
                .resizable()
                .frame(width: 44, height: 36)
        })
                                )
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.movement
    }
    
    static var movement = UIInterfaceOrientationMask.landscape {
        didSet {
            if #available(iOS 16.0, *) {
                UIApplication.shared.connectedScenes.forEach { scene in
                    if let windowScene = scene as? UIWindowScene {
                        windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: movement))
                    }
                }
                UIViewController.attemptRotationToDeviceOrientation()
            } else {
                if movement == .landscape {
                    UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                } else {
                    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                }
            }
        }
    }
}
struct Swiper: ViewModifier {
    var onDismiss: () -> Void
    @State private var offset: CGSize = .zero

    func body(content: Content) -> some View {
        content
//            .offset(x: offset.width)
            .animation(.interactiveSpring(), value: offset)
            .simultaneousGesture(
                DragGesture()
                    .onChanged { value in
                                      self.offset = value.translation
                                  }
                                  .onEnded { value in
                                      if value.translation.width > 70 {
                                          onDismiss()
                                  
                                      }
                                      self.offset = .zero
                                  }
            )
    }
}
extension View {
    func eiFiut() -> some View {
        self.modifier(eiosa())
    }
    
    
   
    
}
