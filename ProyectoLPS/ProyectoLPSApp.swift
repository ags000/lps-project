//
//  ProyectoLPSApp.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

@main
struct ProyectoLPSApp: App {
    @StateObject private var proyectoVM: ViewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView().environmentObject(proyectoVM)
            
        }
    }
}
