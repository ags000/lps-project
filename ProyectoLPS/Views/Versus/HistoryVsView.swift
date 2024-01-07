//
//  HistoryVsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 7/1/24.
//

import SwiftUI

struct HistoryVsView: View {
    
    @EnvironmentObject var proyectoVM: ViewModel
    
    @State var firstPlayer: Player? = nil
    @State var secondPlayer: Player? = nil
    
    var user: UserEntity?
    @State private var vsArray: [VersusEntity] = []
    // https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p231747.png.adapt.50w.png


    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text("Historial de Vs")
                        .font(.title)
                }
                
                ForEach(vsArray){versus in
                    HStack{
                        
                        if versus.ganador == 0 {
                            VStack{
                                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer1)).png.adapt.100w.png"))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 4)
                                            .foregroundColor(Color.green),
                                        alignment: .bottom
                                    )
                                
                                Text("Winner")
                                    .foregroundColor(Color.green)
                                
                            }
                            VStack{
                                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer2)).png.adapt.100w.png"))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 4)
                                            .foregroundColor(Color.green),
                                        alignment: .bottom
                                    )
                                
                                Text("Winner")
                                    .foregroundColor(Color.green)
                            }
                        } else if versus.ganador == 1  {
                            VStack{
                                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer1)).png.adapt.100w.png"))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 4)
                                            .foregroundColor(Color.green),
                                        alignment: .bottom
                                    )
                                
                                Text("Winner")
                                    .foregroundColor(Color.green)
                            }
                            AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer2)).png.adapt.100w.png"))
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            
                
                        } else{
                            
                            
                            AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer1)).png.adapt.100w.png"))
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                            
                            VStack{
                                AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-portraits/p\(String(versus.idPlayer2)).png.adapt.100w.png"))
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                
                                    .overlay(
                                        Rectangle()
                                            .frame(height: 4)
                                            .foregroundColor(Color.green),
                                        alignment: .bottom
                                    )
                                
                                Text("Winner")
                                    .foregroundColor(Color.green)
                            }
                            
                        }
 
                    }
                    
                    
                }
            }
        }
        .onAppear{
            vsArray = getVersusArray(user: user, vm: proyectoVM)
            
            
        }
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


func getPlayerById(idPlayer: Int) async throws -> Player{
        let endpoint = "https://manelme.com/players/\(idPlayer)"
        
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
            return try decoder.decode(Player.self, from: data)
        }catch{
            throw GHError.invalidData
        }
    }
