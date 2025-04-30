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
        if(controlador.pagina_resultados != nil) {
            NavigationStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink {
                                PreviewPersonaje(personaje: personaje)
                            } label: {
                                HStack(spacing: 16) {
                                    AsyncImage(url: URL(string: personaje.image)) { imagen in
                                        imagen
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 80, height: 80)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 60, height: 60)
                                            .background(Color.pink.opacity(0.2))
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    }
                                    Spacer()
                                    Text(personaje.name)
                                        .font(.headline)
                                        //.foregroundColor(.black)
                                        .lineLimit(1)
                                        .truncationMode(.tail)
                                        .tint(Color.pink)
                                    Spacer()
                                }
                                .padding()
                                .frame(maxWidth: .infinity, minHeight: 80)
                                .background(Color.pink.opacity(0.3))
                                .cornerRadius(12)
                            }
                            .simultaneousGesture(TapGesture().onEnded {
                                controlador.descargar_informacion_personaje(id: personaje.id)
                            })
                        }
                    }
                    .padding()
                }
                .background(Color.pink.opacity(0.2))
            }
        }
    }
    
    
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
