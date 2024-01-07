//
//  EstadisticaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 11/12/23.
//

import SwiftUI

struct PlayerDetailView: View {
    //@Binding var vistaMbappe : Bool
    var player : Player
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack() {
            Image("campo-futbol")
                .ignoresSafeArea()
                .padding(.top, 150.0)
                .frame(width: 400, height: 210)
                .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                //.offset(y:-80)
            ZStack{
                   Image("Degradado")
                       .ignoresSafeArea()
                       .frame(width: 400, height: 210)
                       .offset(y:-388)
                   VStack(alignment: .leading){
                       Text("\(player.firstName) \(player.lastName)")
                        .frame(width: 200, alignment: .leading)
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                        .foregroundColor(.white)
                        .lineLimit(2)
                        .truncationMode(.tail)
                       Text("\(player.overallRating)")
                            .fontWeight(.bold)
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                       Text(player.position.shortLabel)
                            .fontWeight(.bold)
                            .font(.system(size: 22))
                            .foregroundColor(.white)
                   }
                    .frame(minWidth: 250, maxWidth: 250)
                    .offset(x:-70, y:-120)
                    //Imagen cabecera
                var avatarUrl = player.avatarUrl.replacingOccurrences(of: "50w", with: "150w")                // Sustituir "50w" por "150w"
                AsyncImage(url: URL(string:avatarUrl))
                        .shadow(color: .black, radius:5)
                        .offset(x:100, y:-105)
                        .zIndex(1)
                AsyncImage(url: URL(string: player.team.imageUrl))
                        .shadow(color: .white, radius:10)
                        .offset(x:115, y:-170)
            }
            HStack{
                Text("Estadísticas")
                    .font(.system(size:15))
                    .padding(.leading, -190.0)
                }
                .frame(width:1000, height: 36)
                .background(.gray)
                .zIndex(1)
                .offset(y: -150)

            VStack(spacing: 30.0){
                HStack(spacing: 50.0){
                    //Primer rectangulo
                    VStack(){
                        Image("speed")
                        Text("\(player.stats.pac.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                   // Spacer()
                    //Segundo rectangulo
                    VStack{
                        Image("tiro")
                        Text("\(player.stats.sho.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                }
                HStack(spacing: 50.0){
                    //Primer rectangulo
                    VStack(){
                        Image("pase")
                        Text("\(player.stats.pas.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                    //Segundo rectangulo
                    VStack{
                        Image("regate")
                        Text("\(player.stats.dribbling.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)

                }
                HStack(spacing: 50.0){
                    //Primer rectangulo
                    VStack(){
                        Image("defensa")
                        Text("\(player.stats.def.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                    //Segundo rectangulo
                    VStack{
                        Image("fisico")
                        Text("\(player.stats.phy.value)")
                            .font(Font.custom("Roboto", size: 24))
                            .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                    }
                    .foregroundColor(.clear)
                    .frame(width: 103.16, height: 123.97)
                    .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                    .cornerRadius(12)
                    .shadow(radius: 3)
                }
            }
            //.foregroundColor(.clear)
            .frame(width: 350, height: 470)
            .background(.white)
            .cornerRadius(15)
            .shadow(radius: 3)
            .offset(y: -150)
            
        }
        .frame(width: 430, height: 932.0)
            .background(.white)
    }
}


/*struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView()
    }
}*/