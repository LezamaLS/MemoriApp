//
//  GameView.swift
//  MemoriApp
//
//  Created by Miguel Lezama on 14/11/23.
//

import SwiftUI

struct GameView: View {
    @State var animalesIzq: [Animaluwu] = []
    @State var animalesDer: [Animaluwu] = []
    @State var seleccion: (selec1: Animaluwu?, selec2: Animaluwu?) = (nil, nil)
    @State var puntaje: [Animaluwu] = []
    @State var isComparing: Bool = false
    
    var body: some View {
        HStack{
            VStack{
                ForEach(animalesIzq){animal in
                    Image(animal.nombre)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .overlay {
                            Color.black
                                .opacity(isSelected(animal) ? 0:1)
                        }
                        .padding()
                        .onTapGesture {
                            animalSeleccionado(animal)
                        }
                }
            }
            VStack{
                ForEach(animalesDer){animal in
                    Image(animal.nombre)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .overlay {
                            Color.black
                                .opacity(isSelected(animal) ? 0:1)
                        }
                        .padding()
                        .onTapGesture {
                            animalSeleccionado(animal)
                        }
                }
            }
        }
        .onAppear{
            generarAnimales()
        }
        .disabled(isComparing)
    }
    
    func animalSeleccionado(_ animal: Animaluwu){
        if seleccion.selec1 == nil{
            seleccion.selec1 = animal
        }
        else if seleccion.selec1?.id != animal.id {
            seleccion.selec2 = animal
            compararSeleccion()
        }
    }
    
    func generarAnimales(){
        let animales: [Animaluwu] = .animales[randomPick:3]
        let animalesIzq: [Animaluwu] = animales.map({
            .init(nombre: $0.nombre)
        })
        self.animalesIzq = animalesIzq.shuffled()
        let animalesDer: [Animaluwu] = animales.map({
            .init(nombre: $0.nombre)
        })
        self.animalesDer = animalesDer.shuffled()
    }
    
    func compararSeleccion(){
        isComparing = true
        if seleccion.selec1?.nombre == seleccion.selec2?.nombre{
            puntaje.append(seleccion.selec2!)
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                animalesIzq.removeAll(where: {
                    $0.nombre == seleccion.selec2!.nombre
                })
                animalesDer.removeAll(where: {
                    $0.nombre == seleccion.selec2!.nombre
                })
                seleccion = (nil, nil)
                isComparing = false
            }
        }
        else{
            DispatchQueue.main.asyncAfter(deadline: .now()+0.5){
                seleccion = (nil, nil)
                isComparing = false
            }
        }
    }
    
    func isSelected(_ animal: Animaluwu) -> Bool{
        if animal.id == seleccion.selec1?.id || animal.id == seleccion.selec2?.id{
            return true
        }
        return false
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
