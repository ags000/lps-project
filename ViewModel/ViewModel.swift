//
//  ViewModel.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import Foundation
import CoreData
import UIKit

class ViewModel: ObservableObject{
    let gestorCoreData = CoreDataManager.instance //singleton
    @Published var usersArray: [UserEntity] = []
    @Published var playersRankArray: [PlayerRankEntity] = []
    @Published var teamsRankArray: [TeamRankEntity] = []
    @Published var vsArray: [VersusEntity] = []

    init(){
        cargarDatos()
        //addUser(name: "Luca", photo: UIImage(systemName: "plus")!, email: "luca@gmail.com", surname: "Gabriel", userName: "LucaTop", password: "123")
        
        
    }
    func cargarDatos(){
        usersArray.removeAll()
        playersRankArray.removeAll()
        teamsRankArray.removeAll()

        let fetchUsers = NSFetchRequest<UserEntity>(entityName: "UserEntity")
        let fetchPlayersRank = NSFetchRequest<PlayerRankEntity>(entityName: "PlayerRankEntity")
        let fetchTeamsRank = NSFetchRequest<TeamRankEntity>(entityName: "TeamRankEntity")
        let fetchVs = NSFetchRequest<VersusEntity>(entityName: "VersusEntity")
        
        do{
            self.usersArray = try gestorCoreData.contexto.fetch(fetchUsers)
            self.playersRankArray = try gestorCoreData.contexto.fetch(fetchPlayersRank)
            self.teamsRankArray = try gestorCoreData.contexto.fetch(fetchTeamsRank)
            self.vsArray = try gestorCoreData.contexto.fetch(fetchVs)
            

        }catch let error{
            print("Error al cargar los datos: \(error)")
        }
    }
    
    func guardarDatos(){
        gestorCoreData.save()
        cargarDatos()
    }
    
    func addVersus(user: UserEntity, idPlayer1: Int32, idPlayer2: Int32, ganador: Int32){
        let newVersus = VersusEntity(context: gestorCoreData.contexto)
        newVersus.idPlayer1 = idPlayer1
        newVersus.idPlayer2 = idPlayer2
        newVersus.ganador = ganador
        newVersus.usersRelation = user
        guardarDatos()
    }
    
    func deleteVersus(versus: VersusEntity){
        gestorCoreData.contexto.delete(versus)
        guardarDatos()
    }
    
    func addUser(name: String, photo: UIImage, email: String, surname: String, userName: String, password: String){
        let newUser = UserEntity(context: gestorCoreData.contexto)
        newUser.name = name
        newUser.photo = photo.pngData()
        newUser.email = email
        newUser.password = password
        newUser.surname = surname
        newUser.userName = userName
        
        guardarDatos()
    }
    func deleteUser(indexSet: IndexSet){
        for index in indexSet{
            gestorCoreData.contexto.delete(usersArray[index])
        }
        guardarDatos()
    }
    
    func addTeamRank(name: String, photo: String, mean: Int16){
        let newTeam = TeamRankEntity(context: gestorCoreData.contexto)
        newTeam.teamName = name
        newTeam.photo = photo
        newTeam.mean = mean
        
        guardarDatos()
    }
    func deleteTeamRank(indexSet: IndexSet){
        for index in indexSet{
            gestorCoreData.contexto.delete(teamsRankArray[index])
        }
        guardarDatos()
    }
    
    func addPlayerRank(name: String, photo: String, mean: Int16){
        let newPlayer = PlayerRankEntity(context: gestorCoreData.contexto)
        newPlayer.name = name
        newPlayer.photo = photo
        newPlayer.mean = mean
        
        guardarDatos()
    }
    func deletePlayersRank(indexSet: IndexSet){
        for index in indexSet{
            gestorCoreData.contexto.delete(playersRankArray[index])
        }
        guardarDatos()
    }
    


}
