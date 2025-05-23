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
    
    var pagina_resultados: PaginaResultado? = nil
    var personaje: MonoChino? = nil
    
    
    init(){
        Task.detached(priority: .high){
            await self.descargar_publicaciones()
            
            await self.descargar_monos_chinos()
        }
    }
    
    func descargar_monos_chinos() async {
        guard let pagina_descargada: PaginaResultado = try? await DragonBallAPI().descargar_pagina_personajes() else { return }
        self.pagina_resultados = pagina_descargada
    }
    
    func descargar_info_personaje(id: Int) async {
        guard let mono_chino: MonoChino = try? await DragonBallAPI().descargar_informacion_personaje(id: id) else { return }
        
        self.personaje = mono_chino
    }
    
    func descargar_informacion_personaje(id: Int) {
        Task.detached(operation: {
            await self.descargar_info_personaje(id: id)
        })
    }
    
    func descargar_publicaciones() async {
        defer{
            print("Esta funcion se mando a llamaar desoues de todos los awaits de mi funcion option \(#function)")
        }
        
        guard let publicacionesDescargadas: [Publicacion] = try? await PlaceHolderAPI().descargar_publicaciones() else {return}
        
        publicaciones = publicacionesDescargadas
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
    
    func descargar_planetas() async {
        guard let planeta_descargado: PaginaResultadoPlaneta = try? await DragonBallAPI().descargar_pagina_planeta() else { return }
        self.pagina_resultados = planeta_descargado
    }
}
