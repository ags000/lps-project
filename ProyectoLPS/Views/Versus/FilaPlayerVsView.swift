//
//  FilaPlayerVsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 30/12/23.
//

import SwiftUI

struct FilaPlayerVsView: View {
    
    @Binding var playerId: Int
    @Binding var displayCard: Bool
    
    var jugador: Player

    var body: some View {
        HStack(alignment: .center, spacing: 16) {
            Text("\(jugador.position.shortLabel)")
                .frame(width: 50, alignment: .leading)

            HStack(alignment: .center, spacing: 10) {
                AsyncImage(url: URL(string: jugador.avatarUrl))
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
                Text("\(jugador.firstName) \(jugador.lastName)")
                    .frame(width: 150, alignment: .leading)
            }

            Text("\(jugador.overallRating)")
                .frame(width: 50, alignment: .trailing)
        }
        .onTapGesture{
            playerId = jugador.id
            displayCard = false
        }
    }
}
/*
struct FilaPlayerVsView_Previews: PreviewProvider {
    static var previews: some View {
        FilaPlayerVsView()
    }
}
*/
