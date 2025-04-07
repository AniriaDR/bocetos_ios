//
//  dragonball_api.swift
//  RedesSociales
//
//  Created by alumno on 02/04/25.
//

import SwiftUI


class DragonBallAPI: Codable{
    let url_base = "https://dragonball-api.com/api"
    
    func descargar_pagina_personajes() async -> PaginaResultado? {
        let ubicacion_recurso = "/characters"
        
        return await descargar(recurso: ubicacion_recurso)
    }
    
    private func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_base)\(recurso)") else{ throw ErroresDeRed.malaDireccionUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw
                ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus }
            do{
                let respuesta_decodificada = try JSONDecoder().decode(TipoGenerico.self, from: datos)
                return respuesta_decodificada
            }
            catch let error as NSError{
                print("El error de tu modelo es:\(error.debugDescription) ")
                throw ErroresDeRed.fallaAlConvertirLaRespuesta
            }
        }
        catch ErroresDeRed.malaDireccionUrl {
            print("Esta mal url")
        }
        catch ErroresDeRed.badResponse {
            print("Esta mal mala respuesta")
            print("en dragon ball api")
        }
        catch ErroresDeRed.badStatus {
            print("Esta mal mal estatus")
        }
        catch ErroresDeRed.fallaAlConvertirLaRespuesta {
            print("Esta mal falla convertir respuesta")
        }
        catch ErroresDeRed.invalidRequest {
            print("Esta mal request invalido")
        }
        catch{
            print("Esta mal")
        }
        
        return nil
    }
    
}
