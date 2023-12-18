//
//  AuthRepository.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation


//En erste caos sep uso mejorar la logica haciando un contact pata hacer mas flexule esta clase
//basada en un protocolo o interfaz

class AuthRepository{
    private let authenticatorFirebaseDatasource: AutheticationDataSourceFirebase
    
    
    init(authenticatorFirebaseDatasource: AutheticationDataSourceFirebase = AutheticationDataSourceFirebase()) {
        self.authenticatorFirebaseDatasource = authenticatorFirebaseDatasource
    }
    
    
    func createNewUser(email:String,password:String, completionBlock: @escaping (Result<Usuario,Error>) -> Void ){
        authenticatorFirebaseDatasource.nuevoUsuario(email: email, password: password,completionBlock: completionBlock)
    }
    
    func login(email:String,password:String, completionBlock: @escaping (Result<Usuario,Error>) -> Void ){
        authenticatorFirebaseDatasource.login(email: email, password: password,completionBlock: completionBlock)
    }
    
    
    func getCurrectUser() -> Usuario? {
        authenticatorFirebaseDatasource.getCurrectSesion()
    }
    
    func signOut() throws{
        try authenticatorFirebaseDatasource.logOut()
    }
    

}
