//
//  EstadisticaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 11/12/23.
//

import SwiftUI

struct EstadisticaView: View {
    var body: some View {
        ZStack() {
            Group {
                
                Image("campo-futbol")
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 263)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .offset(x: 0, y: -341.50)
                    
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
                    .foregroundColor(Color(red: 0.83, green: 0.19, blue: 0.12))
                    .offset(x: -60.50, y: 448.50)
                Text("Jugadores")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                    .offset(x: 42.50, y: 448.50)
                Text("Mi perfil")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.57, green: 0.57, blue: 0.57))
                    .offset(x: 157, y: 448.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 65, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                    )
                    .offset(x: -76.50, y: 454.03)
                    .rotationEffect(.degrees(90))
            }
            Group {
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
                Text("Dinero papel")
                    .font(Font.custom("Roboto", size: 40))
                    .foregroundColor(.white)
                    .offset(x: -85.50, y: -342)
                Text("89")
                    .font(Font.custom("Roboto", size: 24))
                    .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                    .offset(x: -180, y: -310)
                Text("Media")
                    .font(Font.custom("Roboto", size: 14))
                    .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                    .offset(x: -174.50, y: -284)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 210, height: 176)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/210x176"))
                    )
                    .offset(x: 215, y: -302)
                    .opacity(0.50)
            }
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 183, height: 172)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/183x172"))
                    )
                    .offset(x: 123.50, y: -296)
                ZStack() {
                    Group {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 339.34, height: 522.13)
                            .background(Color(red: 1, green: 1, blue: 1).opacity(0.50))
                            .cornerRadius(15)
                            .offset(x: 0, y: 0)
                            .shadow(
                                color: Color(red: 0, green: 0, blue: 0, opacity: 0.20), radius: 4
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: -80.08, y: -164.69)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 63.34, height: 56.10)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                            )
                            .offset(x: -78.27, y: -192.29)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: -80.54, y: -155.19)
                        Text("85")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: -80.54, y: -131.21)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 63.34, height: 56.10)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                            )
                            .offset(x: -77.37, y: -30.31)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 89.59, height: 0)
                            .overlay(Rectangle()
                                .stroke(.black, lineWidth: 0.50))
                            .offset(x: -79.63, y: 6.79)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 63.34, height: 56.10)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                            )
                            .offset(x: 78.27, y: -30.31)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 89.59, height: 0)
                            .overlay(Rectangle()
                                .stroke(.black, lineWidth: 0.50))
                            .offset(x: 76.01, y: 6.79)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: -79.18, y: -2.71)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                    }
                    Group {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: -79.63, y: 10.41)
                        Text("92")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: -79.63, y: 30.77)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: 76.46, y: -2.71)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: 76.01, y: 10.41)
                        Text("87")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: 76.01, y: 30.77)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 63.34, height: 56.10)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                            )
                            .offset(x: -77.37, y: 126.23)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 89.59, height: 0)
                            .overlay(Rectangle()
                                .stroke(.black, lineWidth: 0.50))
                            .offset(x: -79.63, y: 163.34)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 63.34, height: 56.10)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                            )
                            .offset(x: 78.27, y: 126.23)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 89.59, height: 0)
                            .overlay(Rectangle()
                                .stroke(.black, lineWidth: 0.50))
                            .offset(x: 76.01, y: 163.34)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: -79.18, y: 153.83)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                    }
                    Group {
                        Text("75")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: -79.63, y: 188.22)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: 76.46, y: 153.83)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                        Text("80")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: 77.82, y: 188.22)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 103.16, height: 123.97)
                            .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                            .cornerRadius(12)
                            .offset(x: 74.66, y: -164.69)
                            .shadow(
                                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                            )
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: 76.01, y: -155.19)
                        Text("90")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                            .offset(x: 74.20, y: -131.21)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 59.72, height: 59.72)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/60x60"))
                            )
                            .offset(x: -80.08, y: -30.31)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 43.44, height: 65.15)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/43x65"))
                            )
                            .offset(x: 76.46, y: -30.31)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 70.58, height: 76.92)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/71x77"))
                            )
                            .offset(x: 78.27, y: 130.31)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 52.48, height: 52.48)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/52x52"))
                            )
                            .offset(x: -79.18, y: 130.76)
                    }
                    Group {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 57.91, height: 57.91)
                            .background(
                                AsyncImage(url: URL(string: "https://via.placeholder.com/58x58"))
                            )
                            .offset(x: 76.46, y: -188.67)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: -79.63, y: 168.77)
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 73.30, height: 0)
                            .overlay(
                                Rectangle()
                                    .stroke(Color(red: 0.96, green: 0.96, blue: 0.96), lineWidth: 0.50)
                            )
                            .offset(x: 77.82, y: 168.77)
                    }
                }
                .frame(width: 339.34, height: 522.13)
                .offset(x: -0.33, y: 76.07)
                Text("Estadísticas")
                    .font(Font.custom("Roboto", size: 24).weight(.bold))
                    .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                    .offset(x: -130.50, y: -239)
                ZStack() {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 7, height: 29)
                        .background(Color(red: 0.84, green: 0.84, blue: 0.84))
                        .cornerRadius(1)
                        .offset(x: -15, y: 0)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 7, height: 21)
                        .background(Color(red: 0.84, green: 0.84, blue: 0.84))
                        .cornerRadius(1)
                        .offset(x: -5, y: 4)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 7, height: 27)
                        .background(Color(red: 0.84, green: 0.84, blue: 0.84))
                        .cornerRadius(1)
                        .offset(x: 5, y: 1)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 7, height: 12)
                        .background(Color(red: 0.84, green: 0.84, blue: 0.84))
                        .cornerRadius(1)
                        .offset(x: 15, y: 8.50)
                }
                .frame(width: 37, height: 29)
                .offset(x: -25.50, y: -233.50)
            }
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
    
    struct EstadisticaView_Previews: PreviewProvider {
        static var previews: some View {
            EstadisticaView()
        }
    }
}
