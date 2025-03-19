//
//  aqui_guardan_sus_modelos.swift
//  mvvm
//
//  Created by alumno on 14/03/25.
//
import Foundation

struct Temporada: Identifiable{
    var id = UUID()
    var nombre: String
    var cantidad_capitulos: String
}

struct Plataforma: Identifiable{
    var id = UUID()
    var nombre: String
    var icono: String
}

struct InformacionSerie: Identifiable{
    var id = UUID()
    var nombre: String
    var tipo: String
    
    var plataformas: [String] = []
    
    var fecha_estreno: Int
    var sinopsis: String
    
    var temporadas: [Temporada] = []
    
    var caratula: String
    
}
