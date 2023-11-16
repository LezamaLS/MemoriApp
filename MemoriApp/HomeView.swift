//
//  ContentView.swift
//  MemoriApp
//
//  Created by Miguel Lezama on 14/11/23.
//

import SwiftUI



struct HomeView: View {
    var body: some View {
        
        NavigationView{
            VStack{
                Text("MemoriApp")
                    .padding()
                    .font(.headline)
                NavigationLink("Memoria", destination: GameView())
                NavigationLink("Ver Animalitos", destination: AniMenu())
            }
            .background(Image("gradientbg"))
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

