//
//  pantalla_personajes.swift
//  RedesSociales
//
//  Created by alumno on 07/04/25.
//

import SwiftUI

struct PantallaPersonajes: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        if(controlador.PaginaResultados != nil) {
            ScrollView{
                LazyVStack{
                    ForEach(controlador.PaginaResultados!.items) { personaje in
                        Text("El personaje es \(personaje.name)")
                        AsyncImage(url: URL(string: personaje.image))
                    }
                }
            }
        }
        
    }
}

#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
