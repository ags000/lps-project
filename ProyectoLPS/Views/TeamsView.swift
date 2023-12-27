//
//  TeamsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct TeamsView: View {
    var body: some View {
        ZStack() {
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 576, height: 281)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/576x281"))
                    )
                    .offset(x: 0, y: -345.50)
                    .blur(radius: 4)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 430, height: 266)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .offset(x: 0, y: -338)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 383, height: 634)
                    .background(.white)
                    .cornerRadius(15)
                    .offset(x: -0.50, y: 35)
                    .shadow(
                        color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4
                    )
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
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 65, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.85, green: 0.85, blue: 0.85), lineWidth: 0.50)
                    )
                    .offset(x: 20.50, y: 454.03)
                    .rotationEffect(.degrees(90))
            };Group {
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
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 216, height: 34)
                    .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                    .cornerRadius(50)
                    .overlay(
                        RoundedRectangle(cornerRadius: 50)
                            .inset(by: 0.50)
                            .stroke(Color(red: 0.57, green: 0.57, blue: 0.57), lineWidth: 0.50)
                    )
                    .offset(x: 98, y: -376)
                Text("Equipos")
                    .font(Font.custom("Roboto", size: 30).weight(.bold))
                    .foregroundColor(.white)
                    .offset(x: 0, y: -309.50)
                Text("PSG")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -135.50, y: -178.50)
                Text("Real Betis ")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -12.50, y: -178.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -13, y: -237)
            };Group {
                Text("Real Madrid C.F")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 112.50, y: -180.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x67"))
                    )
                    .offset(x: 109, y: -238.57)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -135, y: -237)
                Text("Liverpool")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -132.50, y: -60.50)
                Text("FC Barcelona")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -10, y: -58.50)
                Text("Real Madrid C.F")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 112.50, y: -60.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x67"))
                    )
                    .offset(x: 109, y: -118.57)
                Text("PSG")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -135.50, y: 61.50)
                Text("Real Betis ")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -12.50, y: 61.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -13, y: 3)
            };Group {
                Text("Real Madrid C.F")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 112.50, y: 59.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x67"))
                    )
                    .offset(x: 109, y: 1.43)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -135, y: 3)
                Text("PSG")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -133.50, y: 315.50)
                Text("Real Betis ")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -10.50, y: 315.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -11, y: 257)
                Text("Real Madrid C.F")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 114.50, y: 313.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x67"))
                    )
                    .offset(x: 111, y: 255.43)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -133, y: 257)
                Text("PSG")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -135.50, y: 188.50)
            };Group {
                Text("Real Betis ")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: -12.50, y: 188.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -13, y: 130)
                Text("Real Madrid C.F")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(.black)
                    .offset(x: 112.50, y: 186.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x67"))
                    )
                    .offset(x: 109, y: 128.43)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -135, y: 130)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x64"))
                    )
                    .offset(x: -133, y: -117)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64.19, height: 60)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/64x60"))
                    )
                    .offset(x: -11.91, y: -115)
            }
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
