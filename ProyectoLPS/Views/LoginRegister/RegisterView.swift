//
//  RegisterView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var proyectoVM: ViewModel
    @Binding var user: UserEntity?
    @Binding var isLogged: Bool
    @Binding var isRegister: Bool
    @State var nombre: String = ""
    @State var apellidos: String = ""
    @State var correo: String = ""
    @State var userName: String = ""
    @State var password2: String = ""
    @State var password: String = ""

    var body: some View {
        ScrollView{
            ZStack {
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 838.72, height: 396.28)
                    .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                    .rotationEffect(.degrees(-17.47))
                    .offset(x: 0, y: -570)
                
                Image("logo")
                    .resizable()
                    .frame(width: 350, height: 350)
                    .foregroundColor(.clear)
                    .offset(x: 0, y: -370)
                
                VStack(alignment: .center){
                    Text("Registrarse")
                        .font(Font.custom("Roboto", size: 30))
                        .foregroundColor(.black)
                    
                    HStack{
                        VStack(alignment: .leading){
                            Text("Nombre:")
                                .font(Font.custom("Roboto", size: 16))
                                .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                                .multilineTextAlignment(.leading)
                                
                            TextField("Nombre", text: $nombre)
                                .padding()
                                .frame(width: 158, height: 54)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                                .disableAutocorrection(true)
                                
                        }
                        .padding(.top)
                        
                        VStack(alignment: .leading){
                            Text("Apellidos:")
                                .font(Font.custom("Roboto", size: 16))
                                .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                                .multilineTextAlignment(.leading)
                                
                            TextField("Apellidos", text: $apellidos)
                                .padding()
                                .frame(width: 191, height: 54)
                                .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                                .disableAutocorrection(true)
                                
                        }
                        .padding(.top)
                    }
                    
                    VStack(alignment: .leading){
                        Text("Nombre de usuario:")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(Color(red: 0.37, green: 0.37, blue: 0.37))
                            .multilineTextAlignment(.leading)
                            
                        TextField("Nombre de usuario", text: $userName)
                            .padding()
                            .frame(width: 363, height: 54)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    .padding(.top)
                    
                    VStack(alignment: .leading){
                        Text("Dirección de correo:")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                            
                        TextField("Email", text: $correo)
                            .padding()
                            .frame(width: 363, height: 54)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    .padding(.vertical)
                    
                    VStack(alignment: .leading){
                        Text("Contraseña:")
                            .font(Font.custom("Roboto", size: 16))
                            .foregroundColor(Color(red: 0.38, green: 0.38, blue: 0.38))
                            
                        SecureField("Contraseña", text: $password)
                            .padding()
                            .frame(width: 363, height: 54)
                            .background(Color(red: 0.97, green: 0.97, blue: 0.97))
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 2))
                            .disableAutocorrection(true)
                            .autocapitalization(.none)
                    }
                    .padding(.bottom)
        
                    Button(action: {
                        if let myUser = register(name: nombre, surName: apellidos, userName: userName, email: correo, password: password, vm: proyectoVM){
                            user = myUser
                            isLogged = true
                            isRegister = false
                        }else{
                            //Alert(title: Text("Usuario o contraseña incorrecta"))
                            print("Ha ocurrido un error")
                        }
                    }) {
                        Text("Registrarse")
                            .font(Font.custom("Roboto", size: 25))
                            .foregroundColor(.white)
                    }
                    .foregroundColor(.clear)
                    .frame(width: 208, height: 59)
                    .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                    .cornerRadius(10)
                    
                    Button(action: {
                        isRegister = false
                    }){
                        Text("¿Ya tienes una cuenta? Inicia Sesión")
                            .font(Font.custom("Roboto", size: 16).weight(.semibold))
                            .foregroundColor(.black)
                    }
                    .padding(.top)
                }.padding(.top, 80).offset(y: 10)
            }
            .frame(width: 430, height: 932)
            .background(.white)
        }
    }
}

func checkIfIsLogged(userName: String, password: String, email: String, vm : ViewModel) -> Int {
    if let index = vm.usersArray.firstIndex(where: {($0.userName == userName) || ($0.email == email)}) {
        return index
    }

    return -1
}

func register(name: String, surName: String, userName: String, email: String, password: String, vm : ViewModel) -> UserEntity? {
    let index = checkIfIsLogged(userName: userName, password: password, email: email, vm: vm)
    
    if index == -1 {
        vm.addUser(name: name, photo: UIImage(imageLiteralResourceName: "persona"), email: email, surname: surName, userName: userName, password: password)
        if let indexUser = vm.usersArray.firstIndex(where: {($0.userName == userName) && ($0.password == password)}){
            return vm.usersArray[indexUser]
        }
    }

    return nil
}
