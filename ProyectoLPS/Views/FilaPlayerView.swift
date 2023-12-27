//
//  FilaView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 27/11/23.
//

import SwiftUI

struct FilaPlayerView: View {
    var jugador : Player
    var body: some View {
        HStack(alignment: .center,
               spacing: 50){
            Text("\(jugador.position.shortLabel)")
            HStack(alignment: .center, spacing: 10){
                AsyncImage(url: URL(string: jugador.avatarUrl))
                Text("\(jugador.firstName) \(jugador.lastName)")
            }.frame(width: 200)
            Text("\(jugador.overallRating)")
        }
    }
}


