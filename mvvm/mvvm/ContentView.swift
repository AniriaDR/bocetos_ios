//
//  ContentView.swift
//  mvvm
//
//  Created by alumno on 14/03/25.
//

import SwiftUI

struct ContentView: View {
    @Environment(VistaModeloBasico.self) private var controlador
    @State var mostrar_agregar_pantalla: Bool = false
    var body: some View {
        if controlador.estado_actual_de_la_aplicacion ==
            .mostrando_series {
            MenuPrincipalSeries()
            }
        
        else{
            AgregarSerie()
        }
            
            
    }
}
        
        

#Preview {
    ContentView()
        .environment(VistaModeloBasico())
}
