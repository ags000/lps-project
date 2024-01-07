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
    @Binding var isRegister: Bool
    @State var noUser: Bool = false
    @State private var userName: String = ""
    @State private var password: String = ""
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 838.72, height: 396.28)
                .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                .rotationEffect(.degrees(17.47))
                .offset(x: 0, y: -470)
            
            Image("logo")
                .resizable()
                .frame(width: 350, height: 350)
                .foregroundColor(.clear)
                .offset(x: 0, y: -270)
            
            if noUser {
                popUpLogin().zIndex(3)
                    .offset(y:-300)
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            withAnimation{
                                noUser = false
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
            
            VStack(alignment: .center){
                Text("Iniciar sesión")
                    .font(Font.custom("Roboto", size: 30))
                    .foregroundColor(.black)
                
                VStack(alignment: .leading){
                    Text("Usuario:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                        .multilineTextAlignment(.leading)
                        
                    TextField("UserName", text: $userName)
                        .padding()
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                }
                .padding(.top)
                
                VStack(alignment: .leading){
                    Text("Contraseña:")
                        .font(Font.custom("Roboto", size: 16))
                        .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                        
                    SecureField("Password", text: $password)
                        .padding()
                        .frame(width: 363, height: 54)
                        .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        
                }
                .padding(.vertical)
                
                Button(action: {
                    if let myUser = checkIsLogged(userName: userName, password: password, vm: proyectoVM){
                        user = myUser
                        isLogged = true
                    }else{
                        noUser = true
                    }
                }) {
                    Text("Iniciar sesión")
                        .font(Font.custom("Roboto", size: 25))
                        .foregroundColor(.white)
                }
                .foregroundColor(.clear)
                .frame(width: 208, height: 59)
                .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                .cornerRadius(10)
                
                Button(action: {
                    isRegister = true
                }){
                    Text("¿No tienes cuenta? Regístrate")
                        .font(Font.custom("Roboto", size: 16).weight(.semibold))
                        .foregroundColor(.black)
                }
                .padding(.top)
            }.padding(.top, 80).offset(y: 10)
        }
        .background(.white)
    }
}

func checkIsLogged(userName: String, password: String, vm : ViewModel) -> UserEntity? {
    
    if let index = vm.usersArray.firstIndex(where: {($0.userName == userName) && ($0.password == password)}) {
        return vm.usersArray[index]
    }

    return nil
}

struct popUpLogin: View{
    var body: some View{
        HStack(alignment: .top){
            Text("Usuario o contraseña incorrectos").bold()
        }
        .frame(width: 350, height: 100)
        .background(Color.red.opacity(0.9))
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(.red, lineWidth: 5)
        )
    }
}


