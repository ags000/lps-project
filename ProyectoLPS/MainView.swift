//
//  MainView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//g

import SwiftUI

struct MainView: View {
    @EnvironmentObject var proyectoVM : ViewModel
    @State var user: UserEntity? = nil
    @State var isLogged: Bool = true
    @State var register: Bool = false
    @State var section: Int = 0
    var body: some View {
        if !isLogged && !register{
            LoginView(user: $user, isLogged: $isLogged, register: $register)
        }else if register{
            RegisterView()
            
        }else {
            TabView(selection: $section){
                HomeView(user : $user)
                    .environmentObject(proyectoVM)
                    .tabItem{
                        Image("home")
                        Text("Home")
                    }
                    .tag(0)
                TeamsView()
                    .tabItem{
                        Image("equipo")
                        Text("Teams")
                    }
                    .tag(1)
                PlayersView()
                    .tabItem{
                        Image("jugadores")
                        Text("Players")
                    }
                    .tag(2)
                ProfileView()
                    .environmentObject(proyectoVM)
                    .tabItem{
                        Image("perfil")
                        Text("Profile")
                    }
                VsView()
                    .environmentObject(proyectoVM)
                    .tabItem{
                        Image("perfil")
                        Text("Vs")
                        
                    }
                
            }
        
        }
    }
}


