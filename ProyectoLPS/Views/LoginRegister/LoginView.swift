//
//  LoginView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var proyectoVM: ViewModel
    @Binding var user: UserEntity?
    @Binding var isLogged: Bool
    @Binding var register: Bool
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack() {
            Group {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 208, height: 59)
                    .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                    .cornerRadius(10)
                    .offset(x: 0, y: 168.50)
                    .onTapGesture {
                        if let myUser = checkIsLogged(userName: userName, password: password, vm: proyectoVM){
                            user = myUser
                            isLogged = true
                        }else{
                           // Alert(title: Text("Usuario o contraseña incorrecta"))
                        }
                    }
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 838.72, height: 396.28)
                    .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                    .offset(x: -155.33, y: -475.86)
                    .rotationEffect(.degrees(17.47))
                Text("Iniciar sesión")
                    .font(Font.custom("Roboto", size: 30))
                    .foregroundColor(.black)
                    .offset(x: -0.50, y: -146.50)
                Text("Iniciar sesión")
                    .font(Font.custom("Roboto", size: 25))
                    .foregroundColor(.white)
                    .offset(x: 0, y: 168.50)
                TextField("UserName", text: $userName)
                    .foregroundColor(.black)
                    .frame(width: 363, height: 54)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .cornerRadius(10)
                    .offset(x: -0.50, y: -30)
                    .padding()
                Text("Usuario")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                    .offset(x: -154.50, y: -72.50)
                Button("¿No tienes cuenta? Regístrate", action: {
                    register = true
                    })
                    .font(Font.custom("Roboto", size: 16).weight(.semibold))
                    .italic()
                    .foregroundColor(.black)
                    .offset(x: 0, y: 227)
                Text("Contraseña")
                    .font(Font.custom("Roboto", size: 16))
                    .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                    .offset(x: -141, y: 31.50)
                SecureField("Password", text: $password)
                    .foregroundColor(.black)
                    .frame(width: 363, height: 54)
                    .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                    .cornerRadius(10)
                    .offset(x: -0.50, y: 76)
                    .padding()
            };Group {
                    Image("logo")
                        .resizable()
                        .frame(width: 350, height: 350)
                        .foregroundColor(.clear)
                        .offset(x: 0, y: -286)
            }
        }
        .frame(width: 430, height: 932)
        .background(.white)
    }
}

func checkIsLogged(userName: String, password: String, vm : ViewModel) -> UserEntity? {
    
    if let index = vm.usersArray.firstIndex(where: {($0.userName == userName) && ($0.password == password)}) {
        return vm.usersArray[index]
    }

    return nil
}


