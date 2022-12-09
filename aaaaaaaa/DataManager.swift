//
//  DataManager.swift
//  aaaaaaaa
//
//  Created by Dekimpe Renzo on 07/12/2022.
//

import SwiftUI
import Firebase

class DataManager: ObservableObject {
    @Published var dogs: [Dog] = []
    
    init(){
        fetchDogs()
    }
    
    func fetchDogs(){
        dogs.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Dogs")
        ref.getDocuments { snapshot, error in
            guard error == nil else {
                print (error!.localizedDescription)
                return
            }
            
            if  let snapshot = snapshot{
                for document in snapshot.documents {
                    let data = document.data()
                    
                    let id = data["Id"] as? String ?? ""
                    let breed = data["Breed"] as? String ?? ""
                    let age = data["Age"] as? Int ?? 0
                    
                    let dog = Dog(id: id, breed: breed, age: age)
                    self.dogs.append(dog)
                }
            }
        }
    }
    func addDog(dogBreed:String){
        let db = Firestore.firestore()
        let ref = db.collection("Dogs").document(dogBreed)
        let Newid = dogs.count
        ref.setData(["Breed": dogBreed, "Id": Newid + 1 ]){error in
            if let error = error{
                print(error.localizedDescription)
            }
        }
    }
}
