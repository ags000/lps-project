//
//  RegisterView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct RegisterView: View {
    @EnvironmentObject var proyectoVM: ViewModel
    @Namespace var topID
    @Binding var user: UserEntity?
    @Binding var isLogged: Bool
    @Binding var isRegister: Bool
    @State var camposVacios: Bool = false
    @State var repetidos: Bool = false
    @State var nombre: String = ""
    @State var apellidos: String = ""
    @State var correo: String = ""
    @State var userName: String = ""
    @State var password2: String = ""
    @State var password: String = ""

    var body: some View {
        ZStack {
            if camposVacios {
                popUpCamposVacios().zIndex(3)
                    .offset(y:-300)
                    .onDisappear(){
                        camposVacios = false
                    }
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            withAnimation{
                                camposVacios = false
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
            
            if repetidos {
                popUpRepetido().zIndex(3)
                    .offset(y:-300)
                    .onDisappear(){
                        repetidos = false
                    }
                    .onAppear(){
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                            withAnimation{
                                repetidos = false
                            }
                        }
                    }
                    .transition(.asymmetric(insertion: .move(edge: .bottom), removal: .move(edge: .top)))
            }
            
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 838.72, height: 396.28)
                .background(Color(red: 0.93, green: 0.44, blue: 0.39))
                .rotationEffect(.degrees(-17.47))
                .offset(x: 0, y: -470)
            
            Image("logo")
                .resizable()
                .frame(width: 350, height: 350)
                .foregroundColor(.clear)
                .offset(x: 0, y: -270)
            
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
                    .padding(.top, 5.0)
                    
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
                    .padding(.top, 5.0)
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
                .padding(.top, 5.0)
                
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
                .padding(.top, 5.0)
                
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
                .padding(.bottom, 10.0)
    
                Button(action: {
                    if nombre.isEmpty || apellidos.isEmpty || userName.isEmpty || correo.isEmpty || password.isEmpty {
                        
                        camposVacios = true
                    }else{
                        if let myUser = register(name: nombre, surName: apellidos, userName: userName, email: correo, password: password, vm: proyectoVM){
                            user = myUser
                            isLogged = true
                            isRegister = false
                        }else{
                            repetidos = true
                        }
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
                .padding(.top, 5.0)
            }.padding(.top, 80).offset(y: 50)
        }
        .background(.white)
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

struct popUpCamposVacios: View{
    var body: some View{
        HStack(alignment: .top){
            Text("Por favor, rellene todos los campos").bold()
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

struct popUpRepetido: View{
    var body: some View{
        HStack(alignment: .top){
            Text("Nombre de usuario o correo ya registrados").bold()
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