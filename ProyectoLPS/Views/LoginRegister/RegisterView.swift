//
//  RegisterView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct RegisterView: View {
    @State var nombre: String = ""
    @State var apellidos: String = ""
    @State var correo: String = ""
    @State var username: String = ""
    @State var password2: String = ""
    @State var password: String = ""

    var body: some View {
        ScrollView{
            ZStack() {
                Group {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 208, height: 59)
                        .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                        .cornerRadius(10)
                        .offset(x: -10, y: 401.50)
                    Text("Registrarse")
                        .font(Font.custom("Roboto", size: 25))
                        .foregroundColor(.white)
                        .offset(x: -10.50, y: 401.50)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 838.72, height: 396.28)
                        .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                        .offset(x: 155.33, y: -475.86)
                        .rotationEffect(.degrees(-17.47))
                    Text("Registrarse")
                        .font(Font.custom("Roboto", size: 30))
                        .foregroundColor(.black)
                        .offset(x: -1, y: -167.50)
                    TextField("Nombre...", text: $nombre)
                        .foregroundColor(.black)
                        .frame(width: 158, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: -103, y: -86)
                    Text("Nombre:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                        .offset(x: -151, y: -128.50)
                    Text("Apellidos:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        .offset(x: 25, y: -128.50)
                    TextField("Apellidos...", text: $apellidos)
                        .foregroundColor(.black)
                        .frame(width: 191, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: 85.50, y: -85)
                    Text("Contraseña:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        .offset(x: -139, y: 158.50)
                };Group {
                    SecureField("Contraseña...", text: $password)
                        .foregroundColor(.black)
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: -0.50, y: 203)
                    Text("Repetir contraseña")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        .offset(x: -114.50, y: 260.50)
                    SecureField("Repetir Contraseña...", text: $password2)
                        .foregroundColor(.black)
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: -0.50, y: 305)
                    Text("Correo:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        .offset(x: -156, y: 56.50)
                    TextField("Correo...", text: $correo)
                        .foregroundColor(.black)
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: -0.50, y: 101)
                    Text("Nombre de usuario:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        .offset(x: -113, y: -36.50)
                    TextField("Nombre usuario...", text: $username)
                        .foregroundColor(.black)
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .cornerRadius(10)
                        .offset(x: -1.50, y: 8)
                    Image("logo")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .foregroundColor(.clear)
                        .offset(x: 0, y: -286)
                }
            }
            .frame(width: 430, height: 932)
            .background(.white)
        }
    }
}

