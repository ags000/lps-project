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
    @Binding var vistaOG : Bool
    @State  var vistaMbappe : Bool = false
    @State var vistaAlexia : Bool = false
    @State var vistaHaaland : Bool = false
    
    
    var body: some View {
        NavigationView{
            ZStack() {
                if vistaHaaland{
                    VistaHaaland(vistaHaaland: $vistaHaaland)
                }
                else if vistaAlexia{
                    VistaAlexia(vistaAlexia: $vistaAlexia)
                }
                else if vistaMbappe{
                    EstadisticaView(vistaMbappe: $vistaMbappe)
                }
                else if vistaOG{
                    StatsView(mostrarNuevaVista: $vistaOG)
                }else{
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
                        //Ranking de equipos
                        RankingTeams(muestraNuevaVista: $vistaOG)
                        //Ranking de jugadorea
                        RankingPlayers(vistaMbappe: $vistaMbappe, vistaAlexia: $vistaAlexia, vistaHaaland: $vistaHaaland)
                        //Ultimo enfrentamiento, solo visible en la segunda app
                        #if LPS2
                        Versus(user: $user)
                        #endif
                    
                        
                    }
                    //fondo del navigator
                    HStack{}
                        .foregroundColor(.clear)
                        .frame(width: 430, height: 95)
                        .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                        .cornerRadius(12)
                        .offset(x: 0, y: 405.50)
                }
            }
            .frame(width: 430, height: 932)
            .background(
                Image("fondo-home")
                    .offset(x: -123, y:-300)
            )
        }
            
    }
}



struct Versus: View{
    @EnvironmentObject var proyectoVM : ViewModel
    @State var vsArray : [VersusEntity] = []
    @Binding var user : UserEntity?
    @State var idPlayer1 : String = ""
    var idPlayer2 : String = ""
    

    var body: some View {
        HStack(){}
            .foregroundColor(.clear)
            .frame(width: 375, height: 140)
            .background(Color(red: 0.20, green: 0.20, blue: 0.20).opacity(0.95))
            .cornerRadius(12)
            .offset(x: -0.50, y: 230)
            .shadow(
                color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
            )
            .onAppear {
                vsArray = getVersusArray(user: user, vm: proyectoVM)
                
            }
         Text("Último\nenfrentamiento")
             .font(Font.custom("Inter", size: 13).weight(.bold))
             .foregroundColor(.white)
             .offset(x: -0.50, y: 187)
        HStack{
            if let firstVersus = vsArray.last {
                
                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(firstVersus.idPlayer2).png.adapt.50w.png"))
                    
                    
                    .overlay(
                        Group {
                            if firstVersus.ganador == 2 {
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(Color.green)
                                   
                                
                            }
                        },
                        
                        alignment: .bottom
                    )

                
                    .task{
                        print(firstVersus.idPlayer1)
                        print("First versus")
                    }
            } else {
                Text("No encontrado.")
                
            }
            
        }
             .foregroundColor(.clear)
             .frame(width: 114, height: 140)
             .background(
                
               // not required player's image here.
             )
             .cornerRadius(12)
             .offset(x: 130, y: 230)
             .shadow(
                 color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40, x: 12
             )
        HStack{
            
            if let firstVersus = vsArray.last {
                
                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(firstVersus.idPlayer1).png.adapt.50w.png"))
                
                    .overlay(
                        Group {
                            if firstVersus.ganador == 1 {
                                Rectangle()
                                    .frame(height: 4)
                                    .foregroundColor(Color.green)
                            }
                        },
                        
                        alignment: .bottom
                        
                    )
                    .task{
                        print(firstVersus.idPlayer1)
                        print("First versus")
                    }
            } else {
                Text("No encontrado.")
                
            }
        }
             .foregroundColor(.clear)
             .frame(width: 114, height: 140)
             .background(
                // not required image.
             )
             .cornerRadius(12)
             .offset(x: -130, y: 230)
             .shadow(
                 color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40, x: 12
             )
         
         Text("vs")
             .font(Font.custom("Inter", size: 32).weight(.bold))
             .italic()
             .foregroundColor(.white)
             .offset(x: 0.50, y: 227.50)
        
    }
}

struct RankingTeams: View{
    @Binding var muestraNuevaVista: Bool
    var body: some View {
        HStack(){
            //Text("Ranking de equipos")
        }
        .foregroundColor(.clear)
        .frame(width: 375, height: 140)
        .background(Color(red: 0.20, green: 0.20, blue: 0.20).opacity(0.95))
        .cornerRadius(12)
        .offset(x: -0.50, y: -90)
        .shadow(
            color: Color(red: 0.65, green: 0.19, blue: 0.14, opacity: 0.25), radius: 10
        )
        HStack{}
            .foregroundColor(.clear)
            .frame(width: 375, height: 43)
            .background(Color(red: 0.52, green: 0.19, blue: 0.15))
            .cornerRadius(12)
            .offset(x: -0.50, y: -40)
        ZStack {
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 64, height: 64)
                .background(
                    Image("bayern")
                        .onTapGesture {
                            muestraNuevaVista=true
                        }
                )
                .offset(x: -123, y: -88)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            HStack{
                
                
            }
                .foregroundColor(.clear)
                .frame(width: 64, height: 60)
                .background(
                    Image("inter")
                        .onTapGesture {
                            muestraNuevaVista=true
                        }
                )
                .offset(x: 0.09, y: -110)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 64, height: 66.86)
                .background(
                    Image("barca_home")
                        .onTapGesture {
                            muestraNuevaVista=true
                        }
                )
                .offset(x: 122, y: -76.57)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 87, height: 32)
                .background(Color(red: 0.98, green: 0.69, blue: 0.69))
                .cornerRadius(5)
                .offset(x: -121.50, y: -34)
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 87, height: 19)
                .background(Color(red: 0.98, green: 0.69, blue: 0.69))
                .cornerRadius(5)
                .offset(x: 121.50, y: -27.50)
            Text("3")
                .font(Font.custom("Inter", size: 14).weight(.bold))
                .foregroundColor(.black)
                .offset(x: 121.50, y: -27.50)
            HStack{}
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
            Text("Ranking de equipos")
                .font(Font.custom("Inter", size: 13).weight(.bold))
                .foregroundColor(.white)
                .offset(x: -115, y: -146)
        }
        
    }
    
}

struct RankingPlayers: View{
    @Binding var vistaMbappe : Bool
    @Binding var vistaAlexia : Bool
    @Binding var vistaHaaland : Bool
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
        ZStack {
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 76, height: 76)
                .background(
                    Image("haland_home")
                        .onTapGesture {
                            vistaHaaland = true
                        }
                )
                .offset(x: 79, y: 87)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 98, height: 98)
                .background(
                    Image("alexia")
                        .onTapGesture {
                            vistaAlexia = true
                        }
                )
                .offset(x: -95, y: 84)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 131, height: 123)
                .background(
                    Image("mbappe_home")
                        .onTapGesture {
                            vistaMbappe = true
                        }
                )
                .offset(x: -0.50, y: 73)
                .shadow(
                    color: Color(red: 1, green: 1, blue: 1, opacity: 0.50), radius: 40
                )
            Text("Ranking de jugadores")
                .font(Font.custom("Inter", size: 13).weight(.bold))
                .foregroundColor(.white)
                .offset(x: -115, y: 15)
           
        }
    }
    
    func getVersusArray(user: UserEntity?, vm: ViewModel) -> [VersusEntity]{
        
        
        if user == nil {
            return []
        }
        
        return vm.vsArray.filter{ versus in
            return versus.usersRelation == user
        }
        

    }

}
