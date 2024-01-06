//
//  TeamsView.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import SwiftUI

struct TeamsView: View {
    @State private var response: [Equipo]?
    @State private var buscarEquipo: String = ""
    @State private var contador: Int = 0
    
    @State private var currentPage = 0
    @State private var itemsPerPage = 15
    //@State private var apiData: [Equipo]?
    
    var totalPages: Int {
        return (response!.count + itemsPerPage - 1) / itemsPerPage
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image("equipos")
                VStack {
                    HStack {
                        Spacer()
                        TextField("Buscar equipo", text: $buscarEquipo)
                                                .background(.gray)
                                                .cornerRadius(50)
                                                .frame(width: 150)
                                                .padding(2)
                    }
                    
                    Text("Equipos")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)

            }
            
                
                
                /*HStack {
                    Spacer()
                    TextField("Buscar equipo", text: $buscarEquipo)
                }*/
            
            }
            
            VStack {
                if(response != nil){
                    TabView (selection: $currentPage) {
                        ForEach(0..<totalPages, id: \.self) { page in
                            LazyHGrid(rows: Array(repeating: GridItem(), count: 5), spacing: 10) {
                                ForEach(page * itemsPerPage..<(page+1) * itemsPerPage, id: \.self) { equipo in
                                    if equipo < response!.count {
                                        CuadroView(data: response![equipo])
                                        
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
                    .background(.white)
                    .cornerRadius(15)
                    .shadow(radius: 3)
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                    .indexViewStyle(.page(backgroundDisplayMode: .always))
                    
                    //.indexViewStyle()
                    
                    //PageControl(numberOfPages: totalPages, currentPage: $currentPage)
                }
            }
            .offset(y: -100)
            .frame(width: 350, height: 580)
            
            
            
        }
        
        .task {
            do{
                response = try await getTeams()
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
    
    
    
    func getTeams() async throws -> [Equipo]{
        let endpoint = "https://manelme.com/teams"
        
        guard let url = URL(string: endpoint) else{
            throw GHError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw GHError.invalidResponse
        }
        do{
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            print("Hola")
            return try decoder.decode([Equipo].self, from: data)
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

struct PageControl: View {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    var body: some View {
        HStack {
            ForEach(0..<numberOfPages) { page in
                Circle()
                    .frame(width: 8, height: 8)
                    .foregroundColor(page == currentPage ? .blue : .gray)
                
            }
        }
        .padding(.top, 10)
    }
}


struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
