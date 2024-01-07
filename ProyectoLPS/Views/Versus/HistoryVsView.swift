//
//  HistoryVsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 7/1/24.
//

import SwiftUI

struct HistoryVsView: View {
    
    @EnvironmentObject var proyectoVM: ViewModel
    var user: UserEntity?
    @State private var vsArray: [VersusEntity] = []
    
    var body: some View {
        VStack{
            VStack{
                ForEach(vsArray){versus in
                    HStack{
                        Text("\(String(versus.idPlayer1))")
                        Text("\(String(versus.idPlayer2))")
                        Text("\(String(versus.ganador))")
                    }
                    
                }
            }
        }
        .task{
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
