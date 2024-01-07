//
//  BienvenidaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 7/1/24.
//

import SwiftUI

struct BienvenidaView: View {
    var body: some View {
            ZStack{
                Image("Inicio")
                
                Image("Degradado")
                    .resizable()
                    .frame(width: 430, height: 932)
                    .rotationEffect(.degrees(180))
                
                Text("Bienvenido a LPS Football")
                    .font(Font.custom("Roboto", size: 25))
                    .foregroundColor(.white)
                    .offset(y: -275)
            }
        }
    }
