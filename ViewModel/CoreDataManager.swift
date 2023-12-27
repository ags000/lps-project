//
//  CoreDataManager.swift
//  ProyectoLPS
//
//  Created by Aula03 on 20/11/23.
//

import Foundation
import CoreData

class CoreDataManager{
    static let instance = CoreDataManager() //singleton
    let contenedor: NSPersistentContainer
    let contexto: NSManagedObjectContext
    init(){
        contenedor = NSPersistentContainer(name: "ProyectoLPSModel")
        contenedor.loadPersistentStores{ (descripcion, error) in
            if let error = error {
                print("Error al cargar datos de CoreData: \(error)")
            }else{
                print("Carga de datos correcta")
            }
        }
        contexto = contenedor.viewContext
        }
    func save(){
            do{
                try contexto.save()
                print("Datos almacenados correctamente")
            }catch let error{
                print("Error al guardar datos \(error)")
            }
    }
}
