//
//  menu_aplicacion.swift
//  RedesSociales
//
//  Created by alumno on 31/03/25.
//

import SwiftUI

struct MenuNavegacion: View {
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        TabView{
            GeneralPublicaciones()
                .tabItem { Label("Es esta pantalla", systemImage: "circle") }
                .badge(controlador.publicaciones.count)
            PantallaPersonajes()
                .tabItem { Label {
                    VStack{
                        Text("Dragon Ball DB")
                    }
                } icon: {
                    Circle()
                        .frame(width: 44, height: 44, alignment: .center)
                        .overlay(Text("JJ Abrahams"))
                }
            }
            
            Text("Hola foker tres")
                .tabItem {
                    Label{
                        VStack{
                            Text("Hola")
                            Text("Esto es un segundo link")
                        }
                    }icon: {
                        Circle()
                            .frame(width: 44, height: 44, alignment: .center)
                            .overlay(Text("JJ Abrahams"))
                    }
                }
        }
    }
}

#Preview {
    MenuNavegacion()
        .environment(ControladorAplicacion())
}
