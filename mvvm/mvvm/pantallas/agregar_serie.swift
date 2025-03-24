//
//  agregar_serie.swift
//  mvvm
//
//  Created by alumno on 19/03/25.
//

import SwiftUI

struct AgregarSerie: View {
    @Environment(VistaModeloBasico.self) private var controlador
    
    @State var nombre_de_la_serie: String = ""
    @State var tipo_de_la_serie: String = ""
    @State var plataformas_agregadas: [Plataforma] = []
    
    @State var nombre_plataforma: String = ""
    @State var imagen_plataforma: String = ""
    
    @State var indicar_problemas: Bool = false
    @State var mostrar_agregar_plataformas: Bool = false
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        TextField("Nombre de la serie", text: $nombre_de_la_serie)
        
        if indicar_problemas{
            Text("Hay un problema con tu serie")
        }
        
        TextField("Tipo", text: $tipo_de_la_serie)
        
        Spacer()
        
        Text("Plataformas")
        
        ScrollView(.horizontal){
            HStack{
                ForEach(plataformas_agregadas){ plataforma in
                    Text(plataforma.nombre)
                    
                }
            }
        }
        .sheet(isPresented: $mostrar_agregar_plataformas) {
            Text("Por favor agrega una plataforma")
            
            TextField("Nombre de la plataforma", text: $nombre_plataforma)
            TextField("Indica la imagen", text: $imagen_plataforma)
            
            ScrollView{
                VStack{
                    ForEach(plataformas){plataforma in
                        Text(plataforma.nombre).onTapGesture {
                            //plataforma_seleccionada = plataforma
                        }
                    }
                }
            }
        }
        
        Button("Agregar Plataforma"){
            if !nombre_plataforma.isEmpty && !imagen_plataforma.isEmpty {
                let plataforma_nueva = Plataforma(nombre: nombre_plataforma, icono: imagen_plataforma)
                
                //plataformas_agregadas.append(plataforma_seleccionada)
                plataformas_agregadas.append(plataforma_nueva)
                
                nombre_plataforma = ""
                imagen_plataforma = ""
                
                mostrar_agregar_plataformas.toggle()
            }
        }
        Button("Agregar Serie"){
            var serie_nueva = InformacionSerie(nombre: nombre_de_la_serie, tipo: tipo_de_la_serie, plataformas: plataformas_agregadas, fecha_estreno: 1, sinopsis: "Miau", caratula: "foto polla" )
            indicar_problemas = !controlador.agregar_serie(serie: serie_nueva)
        }
    }
}

#Preview {
    AgregarSerie()
        .environment(VistaModeloBasico())
}
