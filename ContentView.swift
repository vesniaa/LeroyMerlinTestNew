//
//  ContentView.swift
//  LeroyMerlinTestNew
//
//  Created by Евгения Аникина on 19.12.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            MainScreenView()
            LoadingScreenView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
