//
//  AniMenu.swift
//  MemoriApp
//
//  Created by Miguel Lezama on 15/11/23.
//

import SwiftUI
import AVFoundation

struct AniMenu: View {
    @State var index = 0
    var animales: [Animaluwu] = .animales
    @State var reproductor: AVAudioPlayer?
    var body: some View {
        VStack{
            Text(animales[index].nombre)
            Image(animales[index].nombre)
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .padding()
            HStack{
                Button("Sonido"){
                    
                }
                Button("Siguiente"){
                    siguienteAnimal()
                }
            }
        }
    }
    
    func siguienteAnimal(){
        if index < animales.count-1{
            index += 1
        }
        else{
            index = 0
        }
    }
    func reproducirSonido(){
        let path = Bundle.main.path(forResource: "\(animales[index].nombre).mp3", ofType: nil)!
        let url = URL(fileURLWithPath: path)
        reproductor = try? AVAudioPlayer(contentsOf: url)
        reproductor?.play()
    }
}



struct AniMenu_Previews: PreviewProvider {
    static var previews: some View {
        AniMenu()
    }
}
