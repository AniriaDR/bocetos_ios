//
//  primera_pantalla.swift
//  mvvm
//
//  Created by alumno on 14/03/25.
//

import SwiftUI

@main

struct PrimeraPantalla: App{
    
    @State var controlador_basico = VistaModeloBasico()
    
    var body: some Scene{
        WindowGroup{
            ContentView()
                .environment(controlador_basico)
        }
        
    }
    
    
}
