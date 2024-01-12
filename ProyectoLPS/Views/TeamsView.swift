//
//  TeamsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct TeamsView: View {
    @State private var response: [Equipo]?
    @State private var arrayEquipos: [Equipo]?
    
    @State var queryEquipo: String = ""
    @State private var currentPage = 0
    @State private var itemsPerPage = 15
    @State private var totalPages: Int = 0
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    Image("equipos")
                    VStack {
                        HStack {
                            Spacer()
                            BusquedaView(text: $queryEquipo)
                                .frame(width: 190)
                                .offset(x: -70, y: -10)
                                .onChange(of: queryEquipo, perform: {newValue in
                                    arrayEquipos = busquedaEquipo()
                                    totalPages = calcularTotalPages()
                                })
                            
                        }
                        Text("Equipos")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                }
                VStack {
                    if(response != nil){
                        TabView (selection: $currentPage) {
                            
                            if (!queryEquipo.isEmpty) {
                                var numPaginas = calcularTotalPages()
                                ForEach(0..<numPaginas, id: \.self) { page in
                                    LazyHGrid(rows: Array(repeating: GridItem(), count: 5), spacing: 10) {
                                        let startIndex = page * itemsPerPage
                                        let endIndex = min((page + 1) * itemsPerPage, arrayEquipos!.count)
                                        ForEach(startIndex..<endIndex, id: \.self) { indexEquipo in
                                            
                                            NavigationLink(destination: TeamPlayersView(team: arrayEquipos![indexEquipo])){
                                                CuadroView(data: arrayEquipos![indexEquipo])
                                            }
                                        }
                                    }
                                    
                                }
                            }
                            else {
                                ForEach(0..<totalPages, id: \.self) { page in
                                    LazyHGrid(rows: Array(repeating: GridItem(), count: 5), spacing: 10) {
                                        
                                        ForEach(page * itemsPerPage..<(page+1) * itemsPerPage, id: \.self) { indexEquipo in
                                            if (indexEquipo < response!.count) {
                                                NavigationLink(destination: TeamPlayersView(team: response![indexEquipo])) {
                                                    CuadroView(data: response![indexEquipo])
                                                }
                                            }
                                        }
                                    }
                                    .frame(width: UIScreen.main.bounds.width)
                                }
                                .padding(.bottom, 50)
                                .padding(.top, 20)
                                .padding(.leading, 130)
                                .padding(.trailing, 130)
                            }
                            
                        }
                        .background(.white)
                        .cornerRadius(15)
                        .shadow(radius: 3)
                        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                        .indexViewStyle(.page(backgroundDisplayMode: .always))
                        .onAppear(){
                            queryEquipo = ""
                        }
                    }
                }
                .offset(y: -100)
                .frame(width: 350, height: 580)
                
            }
            .task {
                do{
                    response = try await getTeams()
                    arrayEquipos = busquedaEquipo()
                    totalPages = calcularTotalPages()
                    
                }catch GHError.invalidResponse{
                    print("Invalid Response")
                }catch GHError.invalidUrl{
                    print("Invalid url")
                }catch GHError.invalidData{
                    print("Invalid data")
                }catch {
                    print("unexcpected error")
                }
            }
        }
    }
    
    
    
    func calcularTotalPages() -> Int {
        if let equipos = queryEquipo.isEmpty ? response : arrayEquipos {
            return (equipos.count + itemsPerPage - 1) / itemsPerPage
        }
        else {
            return 0
        }
    }
    
    func busquedaEquipo() -> [Equipo] {
        if (!queryEquipo.isEmpty){
            var array : [Equipo] = []
            for equipo in response! {
                let nombre = equipo.name
                if(nombre.contains(queryEquipo)){
                    array.append(equipo)
                }
            }
            print(array)
            return array
        } else {
            return []
        }
    }
    
    func getTeams() async throws -> [Equipo]{
        let endpoint = "https://manelme.com/teams"
        
        guard let url = URL(string: endpoint) else{
            throw GHError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        print("Datos recibidos:", data)
    
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            print("Hola")
            let decodedResponse = try decoder.decode([Equipo].self, from: data)
            print("Adios")
            return decodedResponse
        }catch{
            throw GHError.invalidData
        }
    }
}

struct CuadroView: View {
    let data: Equipo
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: data.image)) { phase in
                switch phase {
                case .empty:
                    ProgressView()
                case .success(let image):
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(maxWidth: 60, maxHeight: 60)
                case .failure:
                    Image(systemName: "photo")
                @unknown default:
                    EmptyView()
                }
            }
                
            Text(data.name)
                .foregroundColor(.black)
                .multilineTextAlignment(.center)
                .font(.caption)
        }
        //.padding(3)
        
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}

