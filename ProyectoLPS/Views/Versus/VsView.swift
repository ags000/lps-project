//
//  VsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 30/12/23.
//

import SwiftUI

struct VsView: View {
    
    @State private var displayUpperEmptyCard: Bool = true
    @State private var displayBottomEmptyCard: Bool = true
    @State private var cardStringUrl: String = "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/192119.png.adapt.122w.png"
    
    @State private var firstPlayerId: Int = -1
    @State private var secondPlayerId: Int = -1
    
    var body: some View {
        
        VStack{
            
            
            Text("Enfrentamiento")
            
            
            VStack{
                
                if displayUpperEmptyCard {
                    Image("Escudo_plus")
                        .frame(width: 122, height: 183)
                } else if !displayUpperEmptyCard && firstPlayerId != -1 {
                    AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/\(String(firstPlayerId)).png.adapt.122w.png"))
                         .frame(width: 122, height: 183)
                         .onTapGesture {
                             displayUpperEmptyCard = true
                             firstPlayerId = -1
                         }
                }
                
                else {

                    
                    PlayersVsView(playerId: $firstPlayerId, displayCard: $displayUpperEmptyCard)
                    
                
                }
                
                
            }
            .onTapGesture{
                displayUpperEmptyCard = false
         
                
            }
            
            Text("VS")
            
            VStack{
                
                if displayBottomEmptyCard {
                    Image("Escudo_plus")
                        .frame(width: 122, height: 183)
                } else if !displayBottomEmptyCard && secondPlayerId != -1 {
                    AsyncImage(url: URL(string: "https://media.contentapi.ea.com/content/dam/ea/easfc/fc-24/ratings/common/full/player-shields/en/\(String(secondPlayerId)).png.adapt.122w.png"))
                         .frame(width: 122, height: 183)
                         .onTapGesture {
                             displayBottomEmptyCard = true
                             secondPlayerId = -1
                         }
                }
                
                else {

                    
                    PlayersVsView(playerId: $secondPlayerId, displayCard: $displayBottomEmptyCard)
                    
                
                }
                
                
            }
            .onTapGesture{
                displayBottomEmptyCard = false
         
                
            }        }

    }
}

struct VsView_Previews: PreviewProvider {
    static var previews: some View {
        VsView()
    }
}
