//
//  ContentView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import SwiftUI

struct AuthenticationView: View {
    
    @State private var typeauthenticator:EAuthentication?
    @ObservedObject  var authenticationViewModel:AuthenticationViewModel

    var body: some View {
        
        
     
        VStack {
            Image(systemName: "lock.shield")
                .resizable()
                .frame(width: 100,height: 120)
            
            
            Button(action: {
                typeauthenticator = .LOGIN
            }, label: {
                Text("Sesion con email")
                
            })
            .buttonStyle(.bordered)
            .controlSize(.extraLarge)
            .buttonBorderShape(.capsule)
            .padding(.top,30)
            Spacer()
            
            HStack{
                
                Button(action: {
                    typeauthenticator = .REGISTER
                }, label: {
                    Text("Registrate")
                        .underline()
                })
                
            }.sheet(item: $typeauthenticator) { sheet in
                switch sheet {
            
                    case .LOGIN:
                        LoginEmailView(authViewModel: authenticationViewModel)
                    case .REGISTER:
                   RegisterView(authenticationViewModel: authenticationViewModel)
                    
                }
            }
        }
    }
}



