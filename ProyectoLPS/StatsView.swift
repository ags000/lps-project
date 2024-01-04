//
//  StatsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 3/1/24.
//

import SwiftUI
import Foundation

struct StatsView: View {
    var body: some View {
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
                   .offset(y: -360)
        HStack{}
            .foregroundColor(.clear)
            .frame(width: 430, height: 95)
            .background(Color(red: 0.96, green: 0.96, blue: 0.96))
            .cornerRadius(12)
            .offset(x: 0, y: 405.50)
    }
    
}



func readCSV() {
    if let filepath = Bundle.main.path(forResource: "nombre_del_archivo", ofType: "csv") {
        do {
            let contents = try String(contentsOfFile: filepath, encoding: .utf8)
            let rows = contents.components(separatedBy: "\n")
            
            for row in rows {
                let columns = row.components(separatedBy: ",")
                for column in columns {
                    // Trabaja con los datos de cada columna como desees
                    print(column)
                }
            }
        } catch {
            print("Error al leer el archivo: \(error)")
        }
    } else {
        print("Archivo no encontrado")
    }
}

struct StatsView_Previews: PreviewProvider {
    static var previews: some View {
        StatsView()
    }
}
