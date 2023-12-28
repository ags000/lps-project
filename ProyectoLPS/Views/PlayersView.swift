//
//  PlayersView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct PlayersView: View {
    @State private var response: Response?
    @State var query : String = ""
    var body: some View {
           VStack{
               ZStack{
                   Image( "jugadoresfondo")
                       .resizable()
                       .frame(width: 430, height: 255)
                       .offset(y:68)
                   Text("Jugadores")
                       .foregroundColor(.white)
                       .fontWeight(.bold)
                       .font(.system(size: 32))
                       .offset(x:-100, y: 40)
                   BusquedaView(text: $query)
                       .frame(width: 300)
                       .offset(x:60, y: 120)
                   
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
                          .offset(y: 44)
               if(response?.results != nil){
                   List(){
                       if(!query.isEmpty){
                           ForEach(response!.results) {player in
                               let nombre = player.firstName + player.lastName.replacingOccurrences(of: " ", with: "")
                               let querySinEspacios = query.replacingOccurrences(of: " ", with: "")
                               if(nombre.contains(querySinEspacios)){
                                   FilaPlayerView(jugador: player)
                               }
                           }
                           
                       }else{
                           ForEach(response!.results) {player in
                               FilaPlayerView(jugador: player)
                           }
                           
                       }
                       
                       
                   }
               }
           }
           .padding(.top, -45.0)
        .frame(width: 430, height: 932)
        
        .task {
            do{
                response = try await getPlayer()
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
    
    func getPlayer() async throws -> Response{
        let endpoint = "https://manelme.com/players/"
        
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
            print("Hola")
            return try decoder.decode(Response.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
}

enum GHError : Error{
    case invalidUrl
    case invalidResponse
    case invalidData
}

struct BusquedaView: View{
    @Binding var text: String
    var body: some View{
        HStack{
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ? Color(UIColor.gray).opacity(0.4) : Color(UIColor.gray).opacity(0.9))
            TextField("Buscar...", text: $text)
            Button(){
                text = ""
            }label: {
                Image(systemName: "x.circle")
            }
            .opacity(text.isEmpty ? 0.0 : 1.0)
            
        }
        .padding()
        .background()
        .frame(width: 250, height: 30)
        .cornerRadius(7)
        
    }
}
struct PlayersView_Previews: PreviewProvider {
    static var previews: some View {
        PlayersView()
    }
}
