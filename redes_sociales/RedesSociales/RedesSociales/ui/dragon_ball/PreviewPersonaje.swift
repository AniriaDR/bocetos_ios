//
//  preview_personaje.swift
//  Redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

let defaul: MonoChino = MonoChino(id: 1, name: "safdaf", ki: "sdfrw", maxKi: "dfdf", race: "dfdfd", gender: "H", description: "Tonoto", image: "", affiliation: "Bueno", originPlanet: nil, transformations: nil)
struct PreviewPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    var personaje: MonoChino
    
    
    var body: some View {
        Text(controlador.personaje?.originPlanet?.name ?? "Planeta")
        AsyncImage(url: URL(string: controlador.personaje?.originPlanet!.image ?? "")){imagen in
            imagen
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(Rectangle())
        } placeholder: {
            ProgressView()
                .padding()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                .background(Color.red)
                .clipShape(Circle())
        }.onAppear {
            print(personaje)
        }
    }
}

#Preview {
    PreviewPersonaje(personaje: defaul)
        .environment(ControladorAplicacion())
}
