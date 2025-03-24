//
//  errores.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

enum ErroresDeRed: Error{
    case malaDireccionUrl
    case invalidRequest
    case badResponse
    case badStatus
    case fallaAlConvertirLaRespuesta
}
