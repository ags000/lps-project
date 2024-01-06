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
        ZStack{
            VStack{
                Button("Volver"){
                    mostrarNuevaVista=false
                    presentationMode.wrappedValue.dismiss()
                    
                }
            }.offset(x: -165,y: -350)
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
                   .offset(y: -315)
            
            ZStack{
                HStack{}
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 95)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(12)
                    .offset(x: 0, y: 405.50)
                
               
            }
        }.zIndex(1)
        FilaDatos()
        
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



