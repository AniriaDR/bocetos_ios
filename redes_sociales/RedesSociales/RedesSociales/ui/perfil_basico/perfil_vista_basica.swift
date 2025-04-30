//
//  perfil_vista_basica.swift
//  RedesSociales
//
//  Created by alumno on 28/03/25.
//

import SwiftUI
import PhotosUI

struct PerfilBasicoVista: View {
        @State var foto_seleccionada:
        PhotosPickerItem? = nil
        @State var foto_a_mostar: UIImage? = nil
    
    @Environment(ControladorAplicacion.self) var controlador
    var body: some View {
        PhotosPicker(selection:
            $foto_seleccionada){
            Image(uiImage: foto_a_mostar ??
                  UIImage(resource: .meow))
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 100, height: 100)
            .clipShape(.circle)
        }
        
            .onChange(of: foto_seleccionada) {valor_anterior, valor_nuevo in
                Task{
                    if let foto_seleccionada, let datos = try? await
                        foto_seleccionada.loadTransferable(type: Data.self){
                        if let imagen = UIImage(data:datos){
                            foto_a_mostar = imagen
                        }
                    }
                }
            }
        Text("User: \(controlador.perfil_a_mostrar?.username ?? "Sacrameow" )")
        Text("Nombre: \(controlador.perfil_a_mostrar?.name ?? "Scaramouche" )")
        Text("Correo: \(controlador.perfil_a_mostrar?.email ?? "Sacrameow@gmail.com" )")
            .onDisappear(){
                print("Fak adios.")
            }
    }
}


#Preview{
    PerfilBasicoVista()
        .environment(ControladorAplicacion())
}
