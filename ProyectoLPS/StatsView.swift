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
            HStack(){
                Text("Nombre.")
                    .font(.system(size:15))
                Spacer()
                Text("Nº Jugadores")
                    .font(.system(size:15))
                Spacer()
                Text("Suma")
                    .font(.system(size:15))
                Spacer()
                Text("Med.")
                    .font(.system(size:15))
            }.padding()
            .frame(width: 400, height: 40)
            .zIndex(1)
            .background(.gray)

            FilaDatos().offset(y:-40)
        }.offset(y:100)
    }
}
    
struct FilaDatos: View {
    @State private var csvData: [CSVData] = []
    
    var body: some View {
        VStack {
            List(csvData) { data in
                HStack {
                    ForEach(data.columns.indices, id: \.self) { index in
                        if index < data.columns.count - 4 {
                            Text(data.columns[index]).frame(maxWidth: 75)
                        }else{
                            Text(data.columns[index])
                        }
                        
                        if index < data.columns.count - 2 {
                            Spacer()
                        }
                    }
                }.frame(alignment: .leading)
            }
            .onAppear {
                if let filepath = Bundle.main.path(forResource: "result", ofType: "csv") {
                    do {
                        let contents = try String(contentsOfFile: filepath)
                        let rows = contents.components(separatedBy: "\n")
                        self.csvData = rows.map { row in
                            let columns = row.components(separatedBy: ";")
                            return CSVData(columns: columns)
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

struct CSVData: Identifiable {
    var id = UUID()
    var columns: [String]
}
