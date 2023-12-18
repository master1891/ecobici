//
//  LoginEmailView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation
import SwiftUI

struct LoginEmailView: View {
    
    @ObservedObject var authViewModel:AuthenticationViewModel
    
    @State var valueEmail:String = ""
    @State var valuePassword:String = ""
    
    var body : some View {
        VStack{
            DismissView()
                .padding(.trailing,20)
                .padding(.top,20)
            Group{
                Text("Bienvenido")
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                
                Text("Inicio de sesión")
                    .font(.system(size: 20))
            }
            
            Group{
                TextField("Correo", text:$valueEmail)
                TextField("Contraseña",text:$valuePassword)
                
                Button("Login"){
                    authViewModel.login(email: valueEmail, password: valuePassword)
                }
                .buttonStyle(.bordered)
                .tint(.blue)
                .padding(.top,30)
            }.textFieldStyle(.roundedBorder)
                .multilineTextAlignment(.center)
                .padding(.horizontal,30)
                Spacer()
        }
    }
}

#Preview{
    LoginEmailView(authViewModel: AuthenticationViewModel())
}
