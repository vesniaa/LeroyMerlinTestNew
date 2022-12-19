//
//  LoadingScreenView.swift
//  LeroyMerlinTestNew
//
//  Created by Евгения Аникина on 19.12.2022.
//

import Foundation
import SwiftUI

struct LoadingScreenView: View {
    
    @State var animate = false
    @State var endSplash = false
    @ObservedObject var nameLoadingLogoV = LoadingLogoVM()
    
    var body: some View {
        ZStack{
        Color(.white)
        Image("\(nameLoadingLogoV.nameLoadingLogoVM.nameLoadingLogo)")
            .resizable()
            .renderingMode(.original)
            .aspectRatio(contentMode: animate ? .fill : .fit)
            .frame(width: animate ? nil : 140, height: animate ? nil : 140)
            .scaleEffect(animate ? 10 : 1)
            .frame(width: UIScreen.main.bounds.width)
        }
        .ignoresSafeArea(.all, edges: .all)
        .onAppear(perform: animateSplash)
        .opacity(endSplash ? 0 : 1)
    }
    func animateSplash(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            withAnimation(Animation.easeOut(duration: 0.75)){
                animate.toggle()
            }
            withAnimation(Animation.easeOut(duration: 0.75)){
                endSplash.toggle()
            }
        }
    }
}

struct LoadingScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingScreenView()
    }
}
