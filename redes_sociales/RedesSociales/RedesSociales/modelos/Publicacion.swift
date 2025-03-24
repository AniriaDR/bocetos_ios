//
//  Publicacion.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI

struct Publicacion: Identifiable, Codable{
    let userId: Int
    let id: Int
    
    let title: String
    let body: String
}

