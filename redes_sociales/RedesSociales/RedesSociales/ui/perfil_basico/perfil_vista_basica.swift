//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/03/25.
//

import SwiftUI

struct PerfilBasicoVista: View {
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Sacrameow" )")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Scaramouche" )")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Sacrameow@gmail.com" )")
            .onDisappear(){
                print("Fak adios.")
            }
    }
}


#Preview{
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
