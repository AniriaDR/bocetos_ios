  //
//  ContentView.swift
//  RedesSociales
//
//  Created by alumno on 24/03/25.
//

import SwiftUI
import PhotosUI

struct ContentView: View {
    @State var foto_seleccionada:
    PhotosPickerItem? = nil
    @State var foto_a_mostar: UIImage? = nil
    
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
    }
}

#Preview {
    ContentView()
        .environment(ControladorAplicacion())
}
