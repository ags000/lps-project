//
//  HomeView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var proyectoVM : ViewModel
    @Binding var user: UserEntity?

    var body: some View {
        ZStack() {
            ZStack {
               
                Image("logo")
                    .resizable()
                    .frame(width: 250, height: 250)
                    .foregroundColor(.clear)
                    .offset(x: 0, y: -286)
            }
            ZStack {
                Text("Hola de vuelta \(user?.userName ?? "Usuario")")
                    .font(Font.custom("Roboto", size: 16).weight(.black))
                    .foregroundColor(.black)
                    .offset(x: -0.50, y: -187)
                //R negro 1
                RankingTeams()
                //Rectangulo rojo
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 375, height: 43)
                    .background(Color(red: 0.52, green: 0.19, blue: 0.15))
                    .cornerRadius(12)
                    .offset(x: -0.50, y: -40)
                //negro 2
                RankingPlayers()
                //Rectangulo negro del ultimo enfrentamiento
                //RankingPayerView()
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 64)
                    .background(
                        Image("psg_home")
                    )
                    .offset(x: -123, y: -88)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64.19, height: 60)
                    .background(
                        Image("barca_home")
                    )
                    .offset(x: 0.09, y: -110)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 64, height: 66.86)
                    .background(
                        Image("madrid_home")
                    )
                    .offset(x: 122, y: -76.57)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 87, height: 32)
                    .background(Color(red: 0.98, green: 0.69, blue: 0.69))
                    .cornerRadius(5)
                    .offset(x: -121.50, y: -34)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 87, height: 19)
                    .background(Color(red: 0.98, green: 0.69, blue: 0.69))
                    .cornerRadius(5)
                    .offset(x: 121.50, y: -27.50)
                Text("3")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: 121.50, y: -27.50)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 87, height: 53)
                    .background(Color(red: 0.98, green: 0.69, blue: 0.69))
                    .cornerRadius(5)
                    .offset(x: -0.50, y: -44.50)
                Text("1")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: -0.50, y: -41.50)
                Text("2")
                    .font(Font.custom("Inter", size: 14).weight(.bold))
                    .foregroundColor(.black)
                    .offset(x: -122.50, y: -31.50)
            }
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 76, height: 76)
                    .background(
                        Image("nose_home")
                    )
                    .offset(x: 79, y: 98)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 98, height: 98)
                    .background(
                        Image("haland_home")
                    )
                    .offset(x: -95, y: 87)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 131, height: 123)
                    .background(
                        Image("mbappe_home")
                    )
                    .offset(x: -0.50, y: 73)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                    )
                Text("Ranking de equipos")
                    .font(Font.custom("Inter", size: 13).weight(.bold))
                    .foregroundColor(.white)
                    .offset(x: -115, y: -146)
                Text("Ranking de jugadores")
                    .font(Font.custom("Inter", size: 13).weight(.bold))
                    .foregroundColor(.white)
                    .offset(x: -115, y: 15)
               /* Text("Último\nenfrentamiento")
                    .font(Font.custom("Inter", size: 13).weight(.bold))
                    .foregroundColor(.white)
                    .offset(x: -0.50, y: 187)*/
               /* Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 114, height: 140)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/114x140"))
                    )
                    .cornerRadius(12)
                    .offset(x: 130, y: 230)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40, x: 12
                    )*/
                
                
                /*Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 85.01, height: 0)
                    .overlay(
                        Rectangle()
                            .stroke(Color(red: 0.27, green: 0.27, blue: 0.27), lineWidth: 0.50)
                    )
                    .offset(x: 2.50, y: 230)*/
                /*Text("vs")
                    .font(Font.custom("Inter", size: 32).weight(.bold))
                    .italic()
                    .foregroundColor(.white)
                    .offset(x: 0.50, y: 227.50)*/
            }
           /* Group{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 114, height: 140)
                    .background(
                        AsyncImage(url: URL(string: "https://via.placeholder.com/114x140"))
                    )
                    .cornerRadius(12)
                    .offset(x: -131, y: 230)
                    .shadow(
                        color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40, x: 12
                    )
            }*/
          
            
        }
        .frame(width: 430, height: 932)
        .background(
            Image("fondo-home")
                .offset(x: -123, y:-300)
        )
    }
}

struct RankingPayerView: View{
    var body: some View {
        HStack(){
            Text("Hola")
            Text("vs")
                .font(Font.custom("Inter", size: 32).weight(.bold))
                .italic()
                .foregroundColor(.white)
                .offset(x: 0.50, y: 227.50)
        }
            .foregroundColor(.clear)
            .frame(width: 375, height: 140)
            .background(Color(red: 0.20, green: 0.20, blue: 0.20).opacity(0.95))
            .cornerRadius(12)
            .offset(x: -0.50, y: 230)
            .shadow(
                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
            )
    }
}

struct RankingTeams: View{
    var body: some View {
        HStack(){
            Text("Ranking de equipos")
        }
            .foregroundColor(.clear)
            .frame(width: 375, height: 140)
            .background(Color(red: 0.20, green: 0.20, blue: 0.20).opacity(0.95))
            .cornerRadius(12)
            .offset(x: -0.50, y: -90)
            .shadow(
                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
            )
    }
}

struct RankingPlayers: View{
    var body: some View {
        HStack(){
            
        }
            .foregroundColor(.clear)
            .frame(width: 375, height: 140)
            .background(Color(red: 0.20, green: 0.20, blue: 0.20).opacity(0.95))
            .cornerRadius(12)
            .offset(x: -0.50, y: 70)
            .shadow(
                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
            )
    }
}
/*
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
*/
