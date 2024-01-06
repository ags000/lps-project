//
//  StatsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 3/1/24.
//

import SwiftUI
import Foundation

struct StatsView: View {
    @Binding var mostrarNuevaVista : Bool
    @Environment(\.presentationMode) var presentationMode
    
    
    var body: some View {
        VStack{
            Button("Volver"){
                mostrarNuevaVista=false
                presentationMode.wrappedValue.dismiss()
                
            }
            .offset(x: -140)
            HStack(alignment: .center,
                   spacing: 80){
                Text("Nombre.")
                    .font(.system(size:10))
                Text("Jugadores")
                    .font(.system(size:10))
                Text("Suma")
                    .font(.system(size:10))
                Text("Med.")
                    .font(.system(size:10))
            }
                   .frame(width:1000, height: 36)
                   .background(.gray)
                   .zIndex(1)
            FilaDatos()
        }
        .offset(y:100)
            
          
        
     
        
        
}

struct FilaDatos : View{
    @State private var csvData : [[String]] = []
    var body: some View{
        ScrollView{
            VStack {
                ForEach(csvData, id: \.self) { row in
                    HStack(alignment: .center, spacing: 80) {
                        ForEach(row, id: \.self) { column in
                            Text(column.replacingOccurrences(of: ";", with: "   "))
                                .padding(8)
                                .border(Color.gray)
                        }
                    }
                }
            }
        }
                .onAppear {
                    if let filepath = Bundle.main.path(forResource: "result", ofType: "csv") {
                        do {
                            let contents = try String(contentsOfFile: filepath)
                            let rows = contents.components(separatedBy: "\n")
                            self.csvData = rows.map { row in
                                row.components(separatedBy: ",")
                            }
                        } catch {
                            print("Error al leer el archivo: \(error)")
                        }
                    } else {
                        print("Archivo no encontrado")
                    }
                }
            }
    }
}



