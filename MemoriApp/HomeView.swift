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
                Button("Jugar", action: {
                    
                })
                Button("Animalitos", action: {
                    
                })
            }}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
