//
//  vista_modelo_basico.swift
//  mvvm
//
//  Created by alumno on 14/03/25.
//
import Foundation

@Observable
class VistaModeloBasico{
    var estado_actual_de_la_aplicacion: EstadosDeLaAplicacion = .mostrando_series
    var series_registradas: Array<InformacionSerie> = []
    
    func agregar_serie(serie: InformacionSerie? = nil) -> Bool{
        if let serie_nueva = serie{
            if serie_nueva.nombre == ""{
                return false
            }
            series_registradas.append(serie_nueva)
        }
        else{
            series_registradas.append(InformacionSerie(nombre: "mm", tipo: "mm", fecha_estreno: 1, sinopsis: "Miau", caratula: "foto polla"))
        }
        
        return true
    }
}
