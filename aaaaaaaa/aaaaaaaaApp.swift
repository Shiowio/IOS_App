//
//  aaaaaaaaApp.swift
//  aaaaaaaa
//
//  Created by Dekimpe Renzo on 02/12/2022.
//

import SwiftUI
import Firebase

@main
struct aaaaaaaaApp: App {
    @StateObject var dataManager = DataManager()
    
    init(){
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
