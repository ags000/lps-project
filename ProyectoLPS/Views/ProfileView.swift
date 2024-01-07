//
//  ProfileView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var proyectoVM : ViewModel
    @Binding var user: UserEntity?
    @Binding var isLogged: Bool
    @State var alerta: Bool = false
    
    var body: some View {
        ZStack() {
            VStack {
                Image("fondoPerfil")
                    .resizable()
                    .foregroundColor(.clear)
                    .frame(width: 390, height: 850)
                
            }
            VStack {
                Image("persona")
                        .resizable()
                        .frame(width: 170, height: 170)
                        .clipShape(Circle())
                        .overlay(Circle().stroke(Color.black))
                        .offset(x: 0, y: -125)
                        .shadow(
                            color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                        )
                    
                Text(user?.userName ?? "Usuario")
                        .font(Font.custom("Roboto", size: 16).weight(.semibold))
                        .foregroundColor(.black)
                        .offset(y: -110)
                    
                Text("\((user?.name ?? "Nombre") + " " + (user?.surname ?? "Apellido"))")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(.black)
                        .offset(y: -100)
                    
                Text(user?.email ?? "dirección@de.correo")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(.black)
                        .offset(y: -90)
                }
            
            VStack {
                Button(action: {
                    alerta = true
                }) {
                    Text("Cerrar sesión")
                        .font(Font.custom("Roboto", size: 25))
                        .foregroundColor(.white)
                }
                .foregroundColor(.clear)
                .frame(width: 208, height: 59)
                .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                .cornerRadius(10)
                .alert(isPresented: $alerta, content: {
                    Alert(title: Text("Cerrar Sesión"),
                          message: Text("¿Estás seguro que quieres cerrar sesión?"),
                          primaryButton: Alert.Button.default(Text("Aceptar"),
                                                             action: {
                                                                isLogged = false
                                                                user = nil
                                                            }),
                          secondaryButton: .destructive(Text("Cancelar")))
                })
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.25), radius: 4, y: 4
                )
            }.offset(x: 0, y: 200)
            //Fondo tab
            HStack{}
                .foregroundColor(.clear)
                .frame(width: 430, height: 95)
                .background(Color(red: 0.96, green: 0.96, blue: 0.96))
                .cornerRadius(12)
                .offset(x: 0, y: 405.50)            }
        }
    }