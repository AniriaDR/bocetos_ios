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
                    LazyVStack {
                        ForEach(controlador.pagina_resultados!.items) { personaje in
                            NavigationLink {
                                PreviewPersonaje()
                            } label: {
                                HStack(spacing: 16) {
                                    Text("El personaje es \(personaje.name)")
                                        .foregroundColor(.black)
                                        .font(.headline)
                                    AsyncImage(url: URL(string: personaje.image)) { imagen in
                                        imagen
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 50, height: 50)
                                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                    } placeholder: {
                                        ProgressView()
                                            .frame(width: 50, height: 50)
                                            .background(Color.blue.opacity(0.4))
                                            .clipShape(Circle())
                                    }
                                }
                                .padding()
                                .background(Color.blue.opacity(0.1))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
#Preview {
    PantallaPersonajes()
        .environment(ControladorAplicacion())
}
