//
//  RedesSocialesApp.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI

@main
@MainActor
struct RedesSocialesApp: App {
    @State var controlador = ControladorAplicacion()
    var body: some Scene {
        WindowGroup {
            GeneralPublicaciones()
            MenuNavegacion()
                .environment(controlador)
        }
    }
}
