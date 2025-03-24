//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    @StateObject var controlador = ControladorPublicaciones()
    
    var body: some View {
        ScrollView{
            VStack{
                ForEach(controlador.publicaciones){ publicacion in
                    Text("\(publicacion.id)")
                    VStack{
                        Text("\(publicacion.title)")
                        Text("\(publicacion.body)")
                    }
                }
            }
        }
        .onAppear {
            print("Hola mundo")
            if controlador.publicaciones.isEmpty{
                Task{
                    await controlador.obtener_publicaciones()
                }
            }
                    
        }
    }
        
}

#Preview {
    GeneralPublicaciones()
}
