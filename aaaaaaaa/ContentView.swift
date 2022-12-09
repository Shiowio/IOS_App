//
//  ContentView.swift
//  TestLogin
//
//  Created by Dekimpe Renzo on 25/11/2022.
//

import SwiftUI
import Firebase

struct ContentView: View {
    @State private var email = ""
    @State private var password = ""
    @State private var userIsLoggedIn = false
    var body: some View {
        
        if userIsLoggedIn{
            ListView()
                .environmentObject(DataManager())
            //content
        }
        else{
            content
        }
    }
    
    var content: some View{
        ZStack{
            
            Color.black
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(LinearGradient(colors: [.blue, .pink], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:-350)
            
            RoundedRectangle(cornerRadius: 30, style: .continuous)
                .foregroundStyle(LinearGradient(colors: [.pink, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
                .frame(width: 1000, height: 400)
                .rotationEffect(.degrees(135))
                .offset(y:300)
        
        
        
            VStack (spacing : 20) {
                TextField("Email", text:$email)
                    .foregroundColor(.black)
                    .textFieldStyle(.plain)
                SecureField("Password", text: $password)
                    .foregroundColor(.white)
                    .textFieldStyle(.plain)
                
                Button{
                    register()
                }label: {
                    Text("Sign up")
                        .bold()
                        .frame(width: 200, height: 40)
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.blue)
                        ).foregroundColor(.white)
                    
                }.padding(.top)
                    .offset(y: 100)
                //test
                Button{
                    login()
                } label: {
                    Text("Already have an account ? Login!")
                        .bold()
                        .foregroundColor(.white)
                }
                .padding(.top)
                .offset(y:100)
                
            }
            .frame(width: 350)
//            .onAppear{
//                Auth.auth().addStateDidChangeListener{ auth, user in
//                    if user != nil{
//                        userIsLoggedIn.toggle()
//                    }
//                }
//            }
        }
        .ignoresSafeArea()
    }
    
    func register(){
        Auth.auth().createUser(withEmail: email, password: password){
            result, error in if error != nil { print( "Loool") //error!.localizedDescription
                userIsLoggedIn.toggle()
            }
        }
    }
    func login(){
        Auth.auth().signIn(withEmail: email, password: password){
            result, error in if error != nil{
                print("Sign in error")
                userIsLoggedIn.toggle()
            }
        }
    }
    
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
