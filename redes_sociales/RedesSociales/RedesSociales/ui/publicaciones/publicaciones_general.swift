//
//  publicaciones_general.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI

struct GeneralPublicaciones: View {
    //@StateObject var controlador = ControladorPublicaciones()
    @Environment(ControladorAplicacion.self) var controlador
    
    var body: some View {
        NavigationStack{
            ScrollView{
                VStack{
                    ForEach(controlador.publicaciones){ publicacion in
                        NavigationLink{
                            PublicacionVista()
                        } label : {
                            HStack{
                                Text("\(publicacion.id)")
                                VStack{
                                    Text("\(publicacion.title)")
                                    Text("\(publicacion.body)")
                                }
                            } 
                            
                            /*/.onTapGesture {
                                //controlador.mostrar_publicacion(publicacion.id)
                                print("Selecciono: \(publicacion.id)")
                            }*/
                        
                        }
                        .simultaneousGesture(TapGesture().onEnded(
                            {
                                controlador.seleccionar_publicacion(publicacion)
                            }))
                    }
                }
            }
        }
        .onAppear{
            print("miau")
        }
    }
        
}

#Preview {
    GeneralPublicaciones()
        .environment(ControladorAplicacion())
}
