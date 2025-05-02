//
//  PantallaPlanetas.swift
//  RedesSociales
//
//  Created by alumno on 02/05/25.
//

import SwiftUI

struct PantallaPlanetas: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        if(controlador.pagina_resultados!.items= nil) {
            NavigationStack {
                ScrollView {
                    LazyVStack(spacing: 16) {
                        ForEach(controlador.pagina_resultados!.items) { planeta in
                            NavigationLink {
                                PreviewPlaneta(planeta: planeta)
                            } label: {
                                HStack(spacing: 16) {
                                    AsyncImage(url: URL(string: planeta.image)) { imagen in
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
                                    VStack(alignment: .leading) {
                                        Text(planeta.name)
                                            .font(.headline)
                                            .foregroundColor(.pink)
                                        if planeta.isDestroyed {
                                            Text("Destruido")
                                                .font(.subheadline)
                                                .foregroundColor(.red)
                                        }
                                    }
                                    Spacer()
                                }
                                .padding()
                                .background(Color.pink.opacity(0.1))
                                .cornerRadius(12)
                            }
                        }
                    }
                    .padding()
                }
                .background(Color.pink.opacity(0.05))
                .navigationTitle("Planetas")
            }
        } else {
            ProgressView("Cargando planetas...")
                .onAppear {
                    controlador.descargar_planetas()
                }
        }
    }
}
#Preview {
    PantallaPlanetas()
        .environment(ControladorAplicacion())
}
