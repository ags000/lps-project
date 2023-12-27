//
//  ProfileView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var proyectoVM : ViewModel

    var body: some View {
        ZStack() {
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 855, height: 437)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/855x437"))
                    )
                    .offset(x: 205.50, y: 503.50)
                    .rotationEffect(.degrees(90))
                    .blur(radius: 8)
                ZStack() {

                }
                .frame(width: 470, height: 701)
                .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                .offset(x: 0, y: -152.50)
                .blur(radius: 10)
                ZStack() {

                }
                .frame(width: 301, height: 449)
                .background(.white)
                .offset(x: 0.50, y: -106.50)
                .blur(radius: 6)
                ZStack() {

                }
                .frame(width: 251, height: 382)
                .background(Color(red: 1, green: 1, blue: 1).opacity(0))
                .offset(x: 0.50, y: -105)
                ZStack() {
                    ZStack() {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 350.57, height: 89.49)
                            .background(Color(red: 0.83, green: 0.52, blue: 0.49))
                            .offset(x: 148.90, y: 87.13)
                            .rotationEffect(.degrees(45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 382.94, height: 97.75)
                            .background(Color(red: 0.94, green: 0.70, blue: 0.68))
                            .offset(x: -146.15, y: 151.33)
                            .rotationEffect(.degrees(45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 382.94, height: 97.75)
                            .background(Color(red: 0.91, green: 0.58, blue: 0.55))
                            .offset(x: -29.92, y: 114.15)
                            .rotationEffect(.degrees(45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 382.94, height: 97.75)
                            .background(Color(red: 0.94, green: 0.70, blue: 0.68))
                            .offset(x: 168.85, y: 163.33)
                            .rotationEffect(.degrees(45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 382.94, height: 97.75)
                            .background(Color(red: 0.92, green: 0.66, blue: 0.63))
                            .offset(x: 35.85, y: 133.33)
                            .rotationEffect(.degrees(45))
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 339.33, height: 65.13)
                            .background(Color(red: 0.98, green: 0.61, blue: 0.57))
                            .offset(x: 221.28, y: 192.01)
                            .rotationEffect(.degrees(45))
                    }
                    .frame(width: 675.23, height: 411)
                    .offset(x: 0, y: 37)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 430, height: 293)
                        .background(
                            AsyncImage(url: URL(string: "https://via.placeholder.com/430x293"))
                        )
                        .offset(x: 92.62, y: -96)
                }
                .frame(width: 675.23, height: 485)
                .offset(x: -92.62, y: 338.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 95)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(12)
                    .offset(x: 0, y: 418.50)
                Text("Home")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                    .offset(x: -157, y: 448.50)
                Text("Equipos")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                    .offset(x: -60.50, y: 448.50)
                Text("Jugadores")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                    .offset(x: 42.50, y: 448.50)
                Text("Mi perfil")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.83, green: 0.19, blue: 0.12))
                    .offset(x: 157, y: 448.50)
            };Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 65, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                    )
                    .offset(x: -76.50, y: 454.03)
                    .rotationEffect(.degrees(90))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 65, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                    )
                    .offset(x: 20.50, y: 454.03)
                    .rotationEffect(.degrees(90))
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 65, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                    )
                    .offset(x: 129.50, y: 454.03)
                    .rotationEffect(.degrees(90))
                ZStack() {

                }
                .frame(width: 33, height: 33)
                .offset(x: -156.50, y: 410.50)
                ZStack() {

                }
                .frame(width: 33, height: 33)
                .offset(x: 41.50, y: 410.50)
                ZStack() {

                }
                .frame(width: 33, height: 33)
                .offset(x: -60.50, y: 410.50)
                ZStack() {

                }
                .frame(width: 33, height: 33)
                .offset(x: 156.50, y: 410.50)
                Text("@felipeTorres")
                    .font(Font.custom("Roboto", size: 16).weight(.semibold))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: -46.50)
                Text("Felipe Torres del Cano")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 0, y: -24.50)
            };Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 160, height: 159.23)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/160x159"))
                    )
                    .cornerRadius(500)
                    .offset(x: 0, y: -152.39)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                    )
                Text("ftorres_delcano@gmail.com")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 0.50, y: 4.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 208, height: 59)
                    .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                    .cornerRadius(10)
                    .offset(x: 0, y: 270.50)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                    )
                Text("Cerrar sesión")
                    .font(Font.custom("Roboto", size: 25))
                    .foregroundColor(.white)
                    .offset(x: 0, y: 270.50)
                ZStack() {

                }
                .frame(width: 24, height: 24)
                .offset(x: 80, y: -218)
            }
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
