//
//  PlayersVsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 30/12/23.
//

import SwiftUI

struct PlayersVsView: View {
    @State private var response: Response?
    @State private var numPage : Int = 1
    @State private var jugadores: [Player] = []
    @State var query : String = ""
    
    @Binding var playerId: Int
    @Binding var displayCard: Bool
    
    var body: some View {
           VStack{
               
               ZStack{
                                   Image( "jugadoresfondo")
                                       .resizable()
                                       .frame(width: 430, height: 255)
                                       .offset(y:68)
                                   Image("Degradado")
                                       .ignoresSafeArea()
                                       .frame(width: 430, height: 255)
                                       .offset(y:68)
                                   Text("Jugadores")
                                       .foregroundColor(.white)
                                       .fontWeight(.bold)
                                       .font(.system(size: 32))
                                       .offset(x:-100, y: 68)
                                   BusquedaView(text: $query)
                                       .frame(width: 300)
                                       .offset(x:60, y: 110)
                                   
                               }
               
               
               HStack(alignment: .center,
                          spacing: 150){
                       Text("Pos.")
                           .font(.system(size:10))
                       Text("Jugador")
                           .font(.system(size:10))
                       Text("Med.")
                           .font(.system(size:10))
                   }
                          .frame(width:1000, height: 36)
                          .background(.gray)
                          .zIndex(1)
                          .offset(y: 40)
               if(response?.results != nil){
                   List(){
                       if(!query.isEmpty){
                           ForEach(response!.results) {player in
                               let nombre = player.firstName + player.lastName.replacingOccurrences(of: " ", with: "")
                               let querySinEspacios = query.replacingOccurrences(of: " ", with: "")
                               if(nombre.contains(querySinEspacios)){
                                   FilaPlayerVsView(playerId: $playerId, displayCard: $displayCard,jugador: player)
                               }
                           }
                           
                       }else{
                           ForEach(response!.results) {player in
                               FilaPlayerVsView(playerId: $playerId, displayCard: $displayCard,jugador: player)                           }
                           
                       }
                       
                       
                   }
               }
               
               
               
               HStack{
                                   Button {
                                       Task {
                                           if(numPage != 1){
                                               numPage = numPage - 1
                                           }
                                           do {
                                               response = try await getPlayer(numPage: numPage)
                                           } catch GHError.invalidResponse {
                                               print("Invalid Response")
                                           } catch GHError.invalidUrl {
                                               print("Invalid URL")
                                           } catch GHError.invalidData {
                                               print("Invalid Data")
                                           } catch {
                                               print("Unexpected Error: \(error)")
                                           }
                                       }
                                   } label: {
                                       Image(systemName: "arrow.left")
                                           .foregroundColor(.white)
                                   }
                                   .padding(.leading)
                                   Spacer()
                                   let texto = "Pág. \(numPage)"
                                   Text(texto)
                                       .bold()
                                       .font(.system(size: 15))
                                       .foregroundColor(.white)
                                   Spacer()
                                   Button {
                                       Task {
                                           if(numPage < 880){
                                               numPage = numPage + 1
                                           }
                                           do {
                                               response = try await getPlayer(numPage: numPage)
                                           } catch GHError.invalidResponse {
                                               print("Invalid Response")
                                           } catch GHError.invalidUrl {
                                               print("Invalid URL")
                                           } catch GHError.invalidData {
                                               print("Invalid Data")
                                           } catch {
                                               print("Unexpected Error: \(error)")
                                           }
                                       }
                                   } label: {
                                       Image(systemName: "arrow.right")
                                           .foregroundColor(.white)
                                   }
                                   .padding(.trailing)
                               }
               
               .frame(width: 150)
               .background(.gray)
               //.zIndex(3)
               .offset(y:-110)
               .padding()
               
           }
           .padding(.top, -45.0)
        .frame(width: 430, height: 932)
        
        .task {
            do{
                                response = try await getPlayer(numPage: numPage)
                                // try await getPlayerAll()
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
    
    
    func getPlayer(numPage: Int) async throws -> Response{
            let endpoint = "https://manelme.com/players?page=\(numPage)"
            
            guard let url = URL(string: endpoint) else{
                throw GHError.invalidUrl
            }
            do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw GHError.invalidResponse
            }
           
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode(Response.self, from: data)
            }catch{
                throw GHError.invalidData
            }
        }
        func getPlayerAll() async throws {
            for pageNumber in 1...880 {
                do {
                    let response = try await getPlayer(numPage: pageNumber)
                    jugadores.append(contentsOf: response.results)
                } catch {
                    print("Error al obtener jugadores de la página \(pageNumber): \(error)")
                }
            }
            
        }
    
}

struct PlayersVsView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
