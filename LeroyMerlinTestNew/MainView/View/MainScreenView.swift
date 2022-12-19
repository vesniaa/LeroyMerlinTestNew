//
//  MainScreenView.swift
//  LeroyMerlinTestNew
//
//  Created by Евгения Аникина on 19.12.2022.
//

import SwiftUI

struct MainScreenView: View {
    var body: some View {
        NavigationView{
            CustomTabView()
                .navigationTitle("")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarHidden(true)
        }
    }
}

struct CustomTabView: View {
    
    @State var edge = UIApplication.shared.connectedScenes.filter({$0.activationState == .foregroundActive}).map({$0 as? UIWindowScene}).compactMap({$0}).first?.windows.filter({$0.isKeyWindow}).first?.safeAreaInsets ?? .zero
    @State var selectedTab = "Главная"
    @ObservedObject var tabsV = TabsVM()
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)) {
            TabView(selection: $selectedTab) {
            
                TabMain().tag("Главная")
                TabMyList().tag("Мой список")
                TabShops().tag("Магазины")
                TabProfile().tag("Профиль")
                TabBasket().tag("Корзина")
               
                
                
            }
                .padding(.vertical,-50)
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                .edgesIgnoringSafeArea([.top])
            
            HStack(spacing: 10){
                ForEach(tabsV.tabsVM.image,id: \.self){image in
                    TabButton(image: image, selectedTab: $selectedTab)
                    if image != tabsV.tabsVM.image.last {
                        Spacer(minLength: 10)
                    }
                }
            }
                .padding(.horizontal,45)
                .padding(.vertical,10)
                .background(Color.white)
                .shadow(color: Color.black.opacity(0.05),radius: 5, x: -5, y: -5)
                .padding(.vertical)
                .padding(.bottom, edge.bottom == 0 ? 0 : -50)
                .padding(.vertical,-10)
            
        }
    }
}

struct TabButton: View {
    
    var image: String
    @Binding var selectedTab: String
    
    var body: some View {
        Button(action: {selectedTab = image}) {
            Image(image).resizable()
                .renderingMode(.template)
                .foregroundColor(selectedTab == image ? Color("ColorGreen") : Color.black.opacity(1.5))
                .frame(width: 55, height: 45)
        }
            .frame(width: 35, height: 75)
    }
}


struct TabMain: View {
    
    @State var txt = ""
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading ,spacing: -55){
                HStack(){
                    Text("Поиск товаров")
                        .foregroundColor(.white)
                        .font(.system(size: 35,weight: .bold))
                        .padding()
                        .padding(.vertical,45)
                }
                HStack(spacing: -15){
                    HStack(){
                        TextField("Поиск", text: $txt)
                            .font(.system(size: 25))
                            .padding()
                        Image("SearchIcon").resizable()
                            .frame(width: 70, height: 60, alignment: .center)
                            .cornerRadius(8)
                            .padding(6)
                    }
                        .background(Color.white)
                        .cornerRadius(8)
                        .padding()
                        
                    HStack(){
                    Button(action: {}){
                        Image("Штрихкод").resizable()
                            .frame(width: 70, height: 72, alignment: .center)
                            .cornerRadius(8)
                            .padding()
                        }
                    }
                }
            }
                .padding(.vertical,10)
                .padding()
                .background(Color("ColorGreen").ignoresSafeArea())
            
            
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: -10) {
                
                
                CatalogView()
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
                        
                Text("Предложение ограничено")
                    .padding(.leading,-140)
                   
                
                ContentLimitedOfferView()
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
                
                Text("Лучшая цена")
                    .padding(.leading,-175)
                
                ContentBestPriceView()
                    .navigationTitle("")
                    .navigationBarTitleDisplayMode(.inline)
                    .navigationBarHidden(true)
                    
                
            }
        }
    }
}


struct MainScreenView_Previews: PreviewProvider {
    static var previews: some View {
        MainScreenView()
    }
}



struct TabBasket: View  {
    var body: some View {
        VStack{
            Text("Корзина")
        }
    }
}

struct TabShops: View  {
    var body: some View {
        VStack{
            Text("Магазины")
        }
    }
}

struct TabMyList: View  {
    var body: some View {
        VStack{
            Text("Мой список")
        }
    }
}

struct TabProfile: View  {
    var body: some View {
        VStack{
            Text("Профиль")
        }
    }
}

struct CatalogView: View {
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(cataloges, id: \.title){course in
                        NavigationLink(destination: DetailCatalog(catalog: course)) {
                            CatalogCardView(catalog: course)
                    }
                }
                    .padding()
            }
                .padding()
                .frame(height: 200)
            Divider()
            Spacer()
            }
        }
    }
}

struct CatalogCardView: View {
    
    var catalog: CatalogM
    
    var body: some View {
        HStack(alignment: .center, spacing: -30){
            VStack{
                Image(catalog.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
            }
                .background(Color.white)
                .cornerRadius(8)
            Spacer(minLength: 0)
        }
    }
}

struct DetailCatalog : View {

    var catalog: CatalogM
    
    var body: some View {
        VStack{
            Image(catalog.asset)
        }
            .navigationTitle(catalog.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
        }))
    }
}



struct ContentLimitedOfferView: View {
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -15) {
                    ForEach(limitedOffers, id: \.title){course in
                        NavigationLink(destination: LimitedOfferDetailView(limitedOffer: course)) {
                            LimitedOfferCardView(limitedOffer: course)
                        }
                    }
                    .padding()
                }
                    .padding()
                    .frame(height: 300)
                Divider()
                Spacer()
            }
            
        }
        
    }
}

struct LimitedOfferCardView: View {

    var limitedOffer: LimitedOfferM

    var body: some View {
        HStack{
            VStack{
                Image(limitedOffer.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
            }
                .background(Color.white)
                .cornerRadius(25)
            Spacer(minLength: 0)
        }
    }
}


struct LimitedOfferDetailView : View {

    var limitedOffer: LimitedOfferM
    
    var body: some View {
        VStack{
            Image(limitedOffer.asset)
        }
        .navigationTitle(limitedOffer.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(trailing: Button(action: {}, label: {
        }))
    }
}



struct ContentBestPriceView: View {
    
    var body: some View {
        VStack {
            Divider()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: -10) {
                    ForEach(bestPrices, id: \.title){course in
                        NavigationLink(destination: BestPriceDetailView(bestPrice: course)) {
                            BestPriceCardView(bestPrice: course)
                        }
                    }
                        .padding()
                }
                    .padding()
                    .frame(height: 300)
                Divider()
                Spacer()
            }
        }
        
    }
}

struct BestPriceCardView: View {

    var bestPrice: BestPriceM

    var body: some View {
        HStack{
            VStack{
                Image(bestPrice.asset)
                    .resizable()
                    .renderingMode(.original)
                    .aspectRatio(contentMode: .fit)
            }
                .background(Color.white)
                .cornerRadius(25)
            Spacer(minLength: 0)
        }
    }
}


struct BestPriceDetailView : View {

    var bestPrice: BestPriceM
    
    var body: some View {
        VStack{
            Image(bestPrice.asset)
        }
            .navigationTitle(bestPrice.title)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button(action: {}, label: {
        }))
    }
}
