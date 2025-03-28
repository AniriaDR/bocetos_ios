//
//  controlador_app.swift
//  RedesSociales
//
//  Created by alumno on 26/03/25.
//

import SwiftUI

@Observable
@MainActor

public class ControladorAplicacion{
    var publicaciones: Array<Publicacion> = []
    var comentarios: Array<Comentario> = []
    
    var publicacion_seleccionada: Publicacion? = nil
    var perfil_a_mostrar: Perfil? = nil
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
        }
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamaar desoues de todos los awaits de mi funcion option \(#function)")
        }
        
        guard let publicaciones_descargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else { return }
        
        publicaciones = publicaciones_descargadas
    }
    
    func descargar_comentarios() async {
        defer{
            print("Esta funcion se mando a llamaar desoues de todos los awaits de mi funcion option \(#function)")
        }
        
        guard let comentarios_descargados: [Comentario] = try? await PlaceHolderAPI().descargar_comentarios(post_id: self._publicacion_seleccionada!.id) else { return }
        
        comentarios = comentarios_descargados

    }
    
    func seleccionar_publicacion(_ publicacion: Publicacion) -> Void {
        publicacion_seleccionada = publicacion
        
        Task.detached(operation: {
            await self.descargar_comentarios()
        })
        print("Publicacion \(publicacion_seleccionada)")
    }
    
    func descargar_perfil(id: Int) async -> Void {
            guard let perfil: Perfil = try? await PlaceHolderAPI().descargar_perfil(id: id) else { return }
            perfil_a_mostrar = perfil

        
    }
    
    func ver_perfil(id:Int) -> Void{
        Task.detached{
            await self.descargar_perfil(id: id)
        }
    }
}
