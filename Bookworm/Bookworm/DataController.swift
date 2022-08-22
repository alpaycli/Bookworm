//
//  DataController.swift
//  Bookworm
//
//  Created by Alpay Calalli on 19.08.22.
//


import CoreData
import Foundation


class DataController: ObservableObject{
    let container = NSPersistentContainer(name: "Bookworm")
    
    init(){
        container.loadPersistentStores{ description, error in
            if let error = error{
                print("CoreData failed to load : \(error.localizedDescription)")
            }
        }
        
        
    }
}
