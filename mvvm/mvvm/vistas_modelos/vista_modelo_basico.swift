//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 14/03/25.
//
import Foundation

@Observable
class VistaModeloBasico{
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie() -> Void{
        print("Foker")
        series_registradas.append(InformacionSerie(nombre: "prueba", tipo: "prueba", fecha_estreno: 2017, sinopsis: "Aqui va la sinopsis", caratula: "imagen_fake"))
    }
}
