//
//  NewDogView.swift
//  aaaaaaaa
//
//  Created by Dekimpe Renzo on 07/12/2022.
//

import SwiftUI

struct NewDogView: View {
    @EnvironmentObject var Datamanager: DataManager
    @State private var newdog = ""
    @State private var newage = 0
    var body: some View {
        VStack {
            TextField("Dog", text: $newdog)
            
            //TextField("Age", text: $newage)
            
            Button {
                Datamanager.addDog(dogBreed: newdog)
            } label: {
                Text("Save")
            }
            Button {
                
            } label: {
                Text("Back")
            }
        }
        .padding()
    }
}

struct NewDogView_Previews: PreviewProvider {
    static var previews: some View {
        NewDogView()
    }
}
