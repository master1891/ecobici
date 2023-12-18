//
//  RegisterView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import SwiftUI

struct RegisterView: View {
    
    @ObservedObject var authenticationViewModel:AuthenticationViewModel
    @State var valueEmail:String = ""
    @State var valuePassword:String = ""
   
    
    var body: some View {
        VStack{
            DismissView()
                .padding(.trailing,20)
                .padding(.top,20)
            
            
            Group{
                Text("Registro")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                
                Text("Registrate para ver los datos")
                    .font(.system(size: 20))
            }
            
            Group{
                TextField("Correo", text:$valueEmail)
                TextField("Contraseña",text:$valuePassword)
                
                Button("Registrar"){
                    authenticationViewModel.createNewUser(email: valueEmail, password: valuePassword)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .padding(.top,30)
                
                if let messageError = authenticationViewModel.messageError{
                    Text(messageError)
                        .bold()
                        .font(.body)
                        .foregroundColor(.red)
                }
                
                
            }.textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                Spacer()
        }
    }
}


