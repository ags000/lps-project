//
//  EstadisticaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 11/12/23.
//

import SwiftUI

struct PlayerDetailView: View {
    //@Binding var vistaMbappe : Bool
    //var player : Player
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        VStack() {
            ZStack{
                Image("campo-futbol")
                    .frame(width: 430, height: 263)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .offset(y:-216)
                VStack(alignment: .leading){
                    Text("Kylian Mbappe")
                        .fontWeight(.bold)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                    Text("91")
                        .fontWeight(.bold)
                        .font(.system(size: 32))
                        .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                    Text("Media")
                        .fontWeight(.bold)
                        .font(.system(size: 22))
                        .foregroundColor(Color(red: 0.84, green: 0.84, blue: 0.84))
                }
                .offset(x:-85, y:-230)

                //Imagen cabecera
                Image("mbappe_home")
                    .resizable()
                    .frame(width: 250, height: 250, alignment:.center)
                    .shadow(color: .black, radius:5)
                    .offset(x:80, y:-185)
                    .zIndex(1)
                AsyncImage(url: URL(string: "https://images.ctfassets.net/rs6bgs1g8dbr/65jMMhRXpQl9A65F6kQtBe/c7b08b18574c48533c1526783bd9b601/73.png"))
                    //.resizable()
                   // .frame(width: 300, height: 300)
                    .shadow(color: .white, radius:10)
                    .offset(x:115, y:-250)
                
            }
            HStack{
                Text("Estadísticas")
                    .font(.system(size:15))
                    .padding(.leading, -190.0)
                }
                .frame(width:1000, height: 36)
                .background(.gray)
                .shadow(color: .gray, radius:5)
                .zIndex(1)
                .offset(y: -250)

            ZStack{
                    //Primer rectangulo
                    HStack{}
                        .foregroundColor(.clear)
                        .frame(width: 103.16, height: 123.97)
                        .background(Color(red: 0.99, green: 0.99, blue: 0.99))
                        .cornerRadius(12)
                        .offset(x: -80.08, y: -164.69)
                        .shadow(
                            color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
                        )
                    //Primer dato
                    HStack{}
                        .foregroundColor(.clear)
                        .frame(width: 63.34, height: 56.10)
                        .background(
                            AsyncImage(url: URL(string: "https://via.placeholder.com/63x56"))
                        )
                        .offset(x: -78.27, y: -192.29)
                    
                    Text("97")
                        .font(Font.custom("Roboto", size: 24))
                        .foregroundColor(Color(red: 0.33, green: 0.33, blue: 0.33))
                        .offset(x: -80.54, y: -131.21)
                        
                }
            }
            .frame(width: 430, height: 932)
            .background(.white)
        }
}

struct PlayerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PlayerDetailView()
    }
}
