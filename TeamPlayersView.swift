//
//  PlayersView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct TeamPlayersView: View {
    var team : Equipo
    
    @State private var response: [Player]?
    @State private var mediaEquipo : Int = 0
    @State private var numPage : Int = 1
    @State var query : String = ""
    @State private var jugadores: [Player] = []
    var body: some View {
        VStack{
            ZStack{
                Image("campo-futbol")
                    .ignoresSafeArea()
                    .padding(.top, 150.0)
                    .frame(width: 400, height: 210)
                    .background(Color(red: 0, green: 0, blue: 0).opacity(0.50))
                    .offset(y:-40)
                Image("Degradado")
                       .ignoresSafeArea()
                       .frame(width: 400, height: 210)
                       //.offset(y:-388)
                HStack(){
                    VStack {
                        Text("\(team.name)")
                            .frame(width: 200, alignment: .leading)
                            .fontWeight(.bold)
                            .font(.system(size: 28))
                            .foregroundColor(.white)
                            .lineLimit(2)
                            .truncationMode(.tail)
                            .offset(x:0, y:50)
                        Text("\(mediaEquipo)")
                            .frame(width: 200, alignment: .leading)
                            .foregroundColor(.white)
                            .offset(x:0, y:60)
                        Text("Media")
                            .frame(width: 200, alignment: .leading)
                            .foregroundColor(.white)
                            .offset(x:0, y:60)
                    }
                    .offset(y:10)
                   
                    Spacer()
                
                    AsyncImage(url: URL(string: team.image))
                        .shadow(color: .white, radius:10)
                        .offset(x:0, y:60)
                }
                    .frame(minWidth: 250, maxWidth: 250)
                    //.offset(x:-70, y:0)
                    //Imagen cabecera
                
            }
            HStack(alignment: .center, spacing: 150){
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
            .offset(y: 19)
            .padding(.bottom, 60)
            
            if(response != nil){
                List(){
                    if(!query.isEmpty){
                        ForEach(response!) {player in
                            let nombre = player.firstName + player.lastName.replacingOccurrences(of: " ", with: "")
                            let querySinEspacios = query.replacingOccurrences(of: " ", with: "")
                            if(nombre.contains(querySinEspacios)){
                                NavigationLink(destination: PlayerDetailView(player: player)){
                                    FilaPlayerView(jugador: player)
                                }
                            }
                        }
                    }else{
                        ForEach(response!) {player in
                            NavigationLink(destination: PlayerDetailView(player: player)){
                                FilaPlayerView(jugador: player)
                            }
                        }
                    }
                }
                .offset(y:-85)
                .onAppear {
                    numPage = 1
                    query = ""
                }
                //.padding(.bottom, 20)
            }
        }
        .frame(width: 430, height: 932)
        .task {
            do{
                response = try await getPlayer()
                mediaEquipo = getMediaEquipo()
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
    
    func getMediaEquipo() -> Int {
        var suma = 0
        for player in response! {
            suma = suma + player.overallRating
        }
        return (suma / response!.count)
    }
    
    func getPlayer() async throws -> [Player]{
        let endpoint = "https://manelme.com/teams/\(team.name)"
        let encodedEndpoint = endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "No se ha podido descifrar la URL"
        print("Ruta endpoint: \(endpoint)")
        guard let url = URL(string: encodedEndpoint) else{
            throw GHError.invalidUrl
        }
        do{
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                throw GHError.invalidResponse
            }
           
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                return try decoder.decode([Player].self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
    /*func getPlayerAll() async throws {
        for pageNumber in 1...880 {
            do {
                let response = try await getPlayer(numPage: pageNumber)
                jugadores.append(contentsOf: response.results)
            } catch {
                print("Error al obtener jugadores de la página \(pageNumber): \(error)")
            }
        }
        
    }*/
}

struct TeamPlayersView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
