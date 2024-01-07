//
//  EstadisticaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 11/12/23.
//

import SwiftUI

struct EstadisticaView: View {
    @Binding var vistaMbappe : Bool
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
                .offset(x:-85, y:-120)
                //Imagen cabecera
                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p231747.png.adapt.150w.png"))
                    .shadow(color: .black, radius:5)
                    .offset(x:100, y:-105)
                    .zIndex(1)
                AsyncImage(url: URL(string: "https://images.ctfassets.net/rs6bgs1g8dbr/65jMMhRXpQl9A65F6kQtBe/c7b08b18574c48533c1526783bd9b601/73.png"))
                    .shadow(color: .white, radius:10)
                    .offset(x:115, y:-170)
                
                
                
                
            }
            HStack{
                Text("Estadísticas")
                    .font(.system(size:15))
                    .padding(.leading, -160.0)
                
                Button("Volver"){
                    vistaMbappe=false
                    presentationMode.wrappedValue.dismiss()
                }
                
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
                        Text("97")
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
                        Text("97")
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
                        Text("97")
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
                        Text("97")
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
                        Text("97")
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
                        // .offset(x: -78.27, y: -192.29)
                        Text("97")
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
