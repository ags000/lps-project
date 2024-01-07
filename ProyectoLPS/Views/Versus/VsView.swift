//
//  VsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 30/12/23.
//

import SwiftUI

struct VsView: View {
    
    @EnvironmentObject var proyectoVM: ViewModel
    var user: UserEntity?
    
    
    @State private var displayUpperEmptyCard: Bool = true
    @State private var displayBottomEmptyCard: Bool = true
    @State private var cardStringUrl: String = "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/192119.png.adapt.122w.png"
    
    @State private var firstPlayerId: Int = -1
    @State private var secondPlayerId: Int = -1
    
    @State private var displayButtonGo: Bool = false
    @State private var responseFirstPLayer: Player?
    @State private var responseSecondPlayer: Player?
    var body: some View {
        
        VStack{
    
        
            
            NavigationView {
                VStack{
                    HStack{
                        Spacer()
                        
                        NavigationLink(destination: HistoryVsView(user: user)
                            .environmentObject(proyectoVM)
                        ) {
                            
                            Image(systemName: "list.bullet")
                                .resizable()
                                .imageScale(.large)
                                .foregroundColor(.primary)
                                .frame(width: 30, height: 30) // Tamaño del icono
                                .padding(.trailing, 20)
                        }
                        
                        
                                           
                        
                    }
                    VStack{
                        Text("Enfrentamiento")
                            .font(.title)
                       
                        
                    }
                    VStack{
                        
                        if displayUpperEmptyCard {
                            
                            
                            NavigationLink(destination: PlayersVsView(playerId: $firstPlayerId, displayCard: $displayUpperEmptyCard)) {
                                Image("Escudo_plus")
                                    .frame(width: 122, height: 183)
                            }
                            
                            //Image("Escudo_plus")
                            //    .frame(width: 122, height: 183)
                        } else if !displayUpperEmptyCard && firstPlayerId != -1 {
                            AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/\(String(firstPlayerId)).png.adapt.122w.png"))
                                .frame(width: 122, height: 183)
                                .onTapGesture {
                                    displayUpperEmptyCard = true
                                    firstPlayerId = -1
                                    displayButtonGo = false
                                }
                                .task{
                                    do{
                                        responseFirstPLayer = try await getPlayer(idPlayer: firstPlayerId)
                                        print(responseFirstPLayer?.firstName)
                                    }catch GHError.invalidResponse{
                                        print("Invalid Response")
                                    }catch GHError.invalidUrl{
                                        print("Invalid url")
                                    }catch GHError.invalidData{
                                        print("Invalid data")
                                    }catch {
                                        print("unexcpected error")
                                    }
                                    
                                }
                        }
                        
                        
                        
                        
                    }
                    .onTapGesture{
                        displayUpperEmptyCard = false
                        
                        
                    }
                    
                    Image("vs")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .onTapGesture{
                            if firstPlayerId != -1 && secondPlayerId != -1 {
                                print("prueba")
                                displayButtonGo = true
                            }
                        }
                    
                    VStack{
                        
                        if displayBottomEmptyCard {
                            
                            NavigationLink(destination: PlayersVsView(playerId: $secondPlayerId, displayCard: $displayBottomEmptyCard)) {
                                Image("Escudo_plus")
                                
                                    .frame(width: 122, height: 183)
                            }
                        } else if !displayBottomEmptyCard && secondPlayerId != -1 {
                            AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/\(String(secondPlayerId)).png.adapt.122w.png"))
                                .frame(width: 122, height: 183)
                                .task{
                                    do{
                                        responseSecondPlayer = try await getPlayer(idPlayer: secondPlayerId)
                                        print(responseSecondPlayer?.firstName)
                                        
                                    }catch GHError.invalidResponse{
                                        print("Invalid Response")
                                    }catch GHError.invalidUrl{
                                        print("Invalid url")
                                    }catch GHError.invalidData{
                                        print("Invalid data")
                                    }catch {
                                        print("unexcpected error")
                                    }
                                }
                                .onTapGesture {
                                    displayBottomEmptyCard = true
                                    secondPlayerId = -1
                                    displayButtonGo = false
                                }
                        }
                        
                        
                        
                        
                    }
                    .onTapGesture{
                        displayBottomEmptyCard = false
                        
                        
                    }
                    VStack{
                        
                        if firstPlayerId != -1 && secondPlayerId != -1 && firstPlayerId != secondPlayerId {
                           
                            NavigationLink(destination: WinnerVsView(user: user, firstPlayer: $responseFirstPLayer, secondPlayer: $responseSecondPlayer)
                                .environmentObject(proyectoVM)
                            ) {
                                Text("GO")
                                    .padding() // Agrega espacio alrededor del texto
                                    .foregroundColor(.white) // Color del texto
                                    .background(Color.red) // Color de fondo del botón
                                    .cornerRadius(10) // Bordes redondeados
                                
                            }
                             
                            
                        }
                    }
                    
                }
                
               
                
                
            }
            
            
            
                .navigationBarTitle("Enfrentamiento", displayMode: .inline)
                
            }
    }
    
    func getPlayer(idPlayer: Int) async throws -> Player{
        let endpoint = "https://manelme.com/players/\(String(idPlayer))"
        
        guard let url = URL(string: endpoint) else{
            throw GHError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return try decoder.decode(Player.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
    
    
    
    
    
    
}

/*
struct VsView_Previews: PreviewProvider {
    static var previews: some View {
        VsView()
    }
}
*/
