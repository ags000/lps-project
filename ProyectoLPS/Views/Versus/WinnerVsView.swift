//
//  WinnerVsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 4/1/24.
//

import SwiftUI

struct WinnerVsView: View {
    
    @Binding var firstPlayer: Player?
    @Binding var secondPlayer: Player?
    @State private var winner: Int = -1
    
    var body: some View{
        
        VStack{
            Text("\(firstPlayer?.firstName ?? "") vs \(secondPlayer?.firstName ?? "")")
            
            
                
                VStack{
                    
                    HStack(alignment: .center, spacing: 10) {
                        AsyncImage(url: URL(string: firstPlayer!.avatarUrl))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text("\(firstPlayer!.firstName) \(firstPlayer!.lastName) (\(String(firstPlayer!.overallRating)))")
                            .frame(width: 150, alignment: .leading)
                    }
                    
                    // se usa group porque solo se permiten poner 10 componentes en swift por defecto
                    Group {
                        
                        
                        HStack{
                            Text("Aceleración")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.acceleration.value))")
                        }
                        
                        HStack{
                            Text("Ataque")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.aggression.value))")
                        }
                        
                        HStack{
                            Text("Agilidad")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.agility.value))")
                        }
                        
                        HStack{
                            Text("Equilibrio")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.balance.value))")
                        }
                        
                        HStack{
                            Text("Control de balón")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.ballControl.value))")
                        }
                    }
                    .padding(.horizontal)
                    .font(.headline)
                    
                    Group {
                        HStack{
                            Text("Defensa")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.defensiveAwareness.value))")
                        }
                        
                        HStack{
                            Text("Regate")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.dribbling.value))")
                        }
                        
                        HStack{
                            Text("Precisión de tiro")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.freeKickAccuracy.value))")
                        }
                        
                        HStack{
                            Text("Tiros largos")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.longShots.value))")
                        }
                        
                        HStack{
                            Text("Velocidad de sprint")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.sprintSpeed.value))")
                        }
                        
                        HStack{
                             Text("Fuerza de tiro")
                             Spacer()
                             Text("\(String(firstPlayer!.stats.shotPower.value))")
                         }
                        
                    }
                    .padding(.horizontal)
                    .font(.headline)
                    
                }
                
                VStack{
                    
                    HStack(alignment: .center, spacing: 10) {
                        AsyncImage(url: URL(string: secondPlayer!.avatarUrl))
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                        Text("\(secondPlayer!.firstName) \(secondPlayer!.lastName) (\(String(secondPlayer!.overallRating)))")
                            .frame(width: 150, alignment: .leading)
                    }
                    
                    Group {
                        
                        
                        HStack{
                            Text("Aceleración")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.acceleration.value))")
                        }
                        
                        HStack{
                            Text("Ataque")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.aggression.value))")
                        }
                        
                        HStack{
                            Text("Agilidad")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.agility.value))")
                        }
                        
                        HStack{
                            Text("Equilibrio")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.balance.value))")
                        }
                        
                        HStack{
                            Text("Control de balón")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.ballControl.value))")
                        }
                    }
                    .padding(.horizontal)
                    .font(.headline)
                    
                    Group {
                        HStack{
                            Text("Defensa")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.defensiveAwareness.value))")
                        }
                        
                        HStack{
                            Text("Regate")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.dribbling.value))")
                        }
                        
                        HStack{
                            Text("Precisión de tiro")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.freeKickAccuracy.value))")
                        }
                        
                        HStack{
                            Text("Tiros largos")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.longShots.value))")
                        }
                        
                        HStack{
                            Text("Velocidad de sprint")
                            Spacer()
                            Text("\(String(secondPlayer!.stats.sprintSpeed.value))")
                        }
                        
                        HStack{
                            Text("Fuerza de tiro")
                            Spacer()
                            Text("\(String(firstPlayer!.stats.shotPower.value))")
                        }
                    }
                    .padding(.horizontal)
                    .font(.headline)
            }
            
            
            if winner == 1 {
                Text("Ganador: \(firstPlayer?.firstName ?? "")")
                    .font(.headline)
                    .foregroundColor(.red)
            }else if winner == 2{
                Text("Ganador: \(secondPlayer?.firstName ?? "")")
                    .font(.headline)
                    .foregroundColor(.red)
                
            }else{
                Text("Empate")
                    .font(.headline)
                    .foregroundColor(.red)
            }
        }
        .task {
            winner = getWinner(player1: firstPlayer!, player2: secondPlayer!)
        }
        
   
    }
        
}

// 0 --> draw
// 1 --> player1 has won
// 2 --> player2 has won
func getWinner(player1: Player, player2: Player) -> Int {
    
    
        var sumStatsPlayer1: Double = 0.0
        var sumStatsPlayer2: Double = 0.0
        
        /*
         Each stat is in range [0,100] and they've been assigned to a certain weight.
         The sum of player's stats multiplied by its weight is between 0 and 185.
         
         It's imperative to represent how lucky a player is when he's fighthing against another.
         So, assuming the lucky as an addition to sumStats. It might be added
         a value between 0 and 55. That's because the luckiest player has 30% of 185 (55) more chance of winning.
         
         */
        
        sumStatsPlayer1 += Double(player1.stats.acceleration.value) * 0.3 // acceleration has a weight of .13
        sumStatsPlayer1 += Double(player1.stats.aggression.value) * 0.06
        sumStatsPlayer1 += Double(player1.stats.agility.value) * 0.17
        sumStatsPlayer1 += Double(player1.stats.balance.value) * 0.03
        sumStatsPlayer1 += Double(player1.stats.ballControl.value) * 0.2
        sumStatsPlayer1 += Double(player1.stats.defensiveAwareness.value) * 0.1
        sumStatsPlayer1 += Double(player1.stats.dribbling.value) * 0.13
        sumStatsPlayer1 += Double(player1.stats.freeKickAccuracy.value) * 0.16
        sumStatsPlayer1 += Double(player1.stats.longShots.value) * 0.24
        sumStatsPlayer1 += Double(player1.stats.sprintSpeed.value) * 0.27
        sumStatsPlayer1 += Double(player1.stats.shotPower.value) * 0.19
        
        sumStatsPlayer2 += Double(player2.stats.acceleration.value) * 0.3 // acceleration has a weight of .13
        sumStatsPlayer2 += Double(player2.stats.aggression.value) * 0.06
        sumStatsPlayer2 += Double(player2.stats.agility.value) * 0.17
        sumStatsPlayer2 += Double(player2.stats.balance.value) * 0.03
        sumStatsPlayer2 += Double(player2.stats.ballControl.value) * 0.2
        sumStatsPlayer2 += Double(player2.stats.defensiveAwareness.value) * 0.1
        sumStatsPlayer2 += Double(player2.stats.dribbling.value) * 0.13
        sumStatsPlayer2 += Double(player2.stats.freeKickAccuracy.value) * 0.16
        sumStatsPlayer2 += Double(player2.stats.longShots.value) * 0.24
        sumStatsPlayer2 += Double(player2.stats.sprintSpeed.value) * 0.27
        sumStatsPlayer2 += Double(player2.stats.shotPower.value) * 0.19
        
        sumStatsPlayer1 += Double.random(in: 0...55.0)
        sumStatsPlayer2 += Double.random(in: 0...55.0)
        
        if sumStatsPlayer1 > sumStatsPlayer2 {
            return 1
        }else if sumStatsPlayer1 < sumStatsPlayer2 {
            return 2
        }else{
            return 0
        }
    
}

/*
struct WinnerVsView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerVsView()
    }
}

*/
