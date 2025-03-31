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
                                VStack{
                                    Text("\(publicacion.id)")
                                        .tint(Color.red)
                                        .font(.headline)
                                    Spacer()
                                        Text("\(publicacion.title)")
                                        .tint(Color.black)
                                        .font(.title)
                                        .bold()
                                        
                                    Spacer()
                                        Text("\(publicacion.body)")
                                        .tint(Color.gray)
                                    Spacer()
                                    
                                    }
                            
                                
                            .fontDesign(.rounded)
                            .padding(40)
                            .background(Color(red: 0.60, green: 0.80, blue: 1))
                            .cornerRadius(15)

                        
                             
                            
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
