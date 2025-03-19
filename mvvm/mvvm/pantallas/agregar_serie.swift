//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 19/03/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var Controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas: [Plataforma] = [
        Plataforma(nombre: "Hulu", icono: "Icono plus")
    ]
    
    @State var indicar_problemas: Bool = false
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        TextField("Nombre de la serie", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        
        Text("Plataformas")
        ScrollView{
            
            HStack{
                ForEach(plataformas){ plataforma in
                    Text (plataforma.nombre)
                    
                }
            }
        }
        
        
        Button("Agregar Plataforma"){
            print("Agregar plataforma")
        }
        Button("Agregar Serie"){
            print("Agregando serie")
            
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas, fecha_estreno: 1, sinopsis: "Miau", caratula: "foto polla" )
            indicar_problemas = Controlador.agregar_serie(serie: serie_nueva)
        }
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
