//
//  placeholder_api.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI

class PlaceHolderAPI: Codable{
    let url_de_servicio = "https://jsonplaceholder.typicode.com"
    
    func descargar_publicaciones() async -> [Publicacion]? {
        
        let ubicacion_recurso = "/posts"
        return await descargar(recurso: ubicacion_recurso)
        
    }
    func descargar_comentarios(post_id: Int) async -> [Comentario]? {
        let ubicacion_recurso = "/posts/\(post_id)/comments"
        return await descargar(recurso: ubicacion_recurso)
    }
    func descargar<TipoGenerico: Codable>(recurso: String) async -> TipoGenerico? {
        do {
            guard let url = URL(string: "\(url_de_servicio)\(recurso)") else{ throw ErroresDeRed.malaDireccionUrl }
            let (datos, respuesta) = try await URLSession.shared.data(from: url)
            guard let respuesta = respuesta as? HTTPURLResponse else { throw
                ErroresDeRed.badResponse }
            guard respuesta.statusCode >= 200 && respuesta.statusCode < 300 else { throw ErroresDeRed.badStatus }
            guard let respuesta_decodificada = try? JSONDecoder().decode(TipoGenerico.self, from: datos) else { throw
                ErroresDeRed.fallaAlConvertirLaRespuesta }
            
            return respuesta_decodificada
        }
        catch ErroresDeRed.malaDireccionUrl {
            print("Esta mal url")
        }
        catch ErroresDeRed.badResponse {
            print("Esta mal mala respuesta")
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
