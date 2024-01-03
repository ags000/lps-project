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
    @State var isLogged: Bool = false
    @State var isRegister: Bool = false
    @State var section: Int = 0
    @State var vistaOG: Bool = false
    var body: some View {
        if !isLogged && !isRegister{
            LoginView(user: $user, isLogged: $isLogged, isRegister: $isRegister)
        }else if isRegister{
            RegisterView(user: $user, isLogged: $isLogged, isRegister: $isRegister)
        }else {
            TabView(selection: $section){
                HomeView(user : $user, vistaOG : $vistaOG)
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
                ProfileView(user : $user, isLogged: $isLogged)
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


