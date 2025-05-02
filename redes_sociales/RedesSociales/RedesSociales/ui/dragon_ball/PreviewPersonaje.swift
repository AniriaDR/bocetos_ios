//
//  preview_personaje.swift
//  Redes_sociales
//
//  Created by alumno on 4/7/25.
//

import SwiftUI

let defaul: MonoChino = MonoChino(
    id: 1,
    name: "pssy",
    ki: "pssy",
    maxKi: "pssy",
    race: "pssy",
    gender: "pssy",
    description: "pssy",
    image: "",
    affiliation: "pssy",
    originPlanet: nil,
    transformations: nil
)

struct PreviewPersonaje: View {
    @Environment(ControladorAplicacion.self) var controlador
    var personaje: MonoChino

    var body: some View {
        TabView {
            ScrollView {
                VStack(spacing: 20) {
                    AsyncImage(url: URL(string: personaje.image)) { imagen in
                                imagen
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 250, height: 250)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .shadow(color: .pink.opacity(0.5), radius: 10, x: 0, y: 5)
                            } placeholder: {
                                ProgressView()
                                    .padding()
                                    .frame(width: 100, height: 100)
                                    .background(Color.pink.opacity(0.3))
                                    .clipShape(Circle())
                            }

                    VStack(alignment: .leading, spacing: 8) {
                        Text("Nombre: \(personaje.name)")
                        Text("Raza: \(personaje.race)")
                        Text("Género: \(personaje.gender)")
                        Text("Afiliación: \(personaje.affiliation)")
                        Text("Ki: \(personaje.ki)")
                        Text("Máximo Ki: \(personaje.maxKi)")
                        Text("Descripción: \(personaje.description)")
                        Text("Planeta: \(controlador.personaje?.originPlanet?.name ?? "Desconocido")")
                    }
                    .padding()
                    .background(Color.pink.opacity(0.1))
                    .cornerRadius(15)
                    .foregroundColor(.pink)
                }
                .padding()
            }

            VStack(spacing: 20) {
                Text(controlador.personaje?.originPlanet?.name ?? "prueba")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.pink)

                AsyncImage(url: URL(string: controlador.personaje?.originPlanet?.image ?? "")) { imagen in
                    imagen
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .pink.opacity(0.5), radius: 10, x: 0, y: 5)
                } placeholder: {
                    ProgressView()
                        .padding()
                        .frame(width: 100, height: 100)
                        .background(Color.pink.opacity(0.3))
                        .clipShape(Circle())
                }
            }
            .padding()
        }
        .accentColor(.pink)
        .onAppear {
            print(personaje)
        }
    }
}


#Preview {
    PreviewPersonaje(personaje: defaul)
        .environment(ControladorAplicacion())
}


