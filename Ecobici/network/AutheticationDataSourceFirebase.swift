//
//  AutheticationDataSourceFirebase.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation
import FirebaseAuth

struct Usuario{
    let emails:String
}

class AutheticationDataSourceFirebase{
    
    func nuevoUsuario(email:String,password:String,completionBlock: @escaping(Result<Usuario,Error>) -> Void){
        Auth.auth().createUser(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Error al crear el nuevo usuario \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
            let email = result?.user.email ?? "No hay email"
            print(email)
            
            completionBlock(.success(.init(emails: email)))
            
        }
    }
    
    func login(email:String,password:String,completionBlock: @escaping(Result<Usuario,Error>) -> Void){
        Auth.auth().signIn(withEmail: email, password: password){ result, error in
            if let error = error{
                print("Error al iniciar sesion: \(error.localizedDescription)")
                completionBlock(.failure(error))
            }
            let email = result?.user.email ?? "No hay email"
            print(email)
            
            completionBlock(.success(.init(emails: email)))
            
        }
    }
    
    
    func getCurrectSesion() -> Usuario?{
    
        guard let currectSessionEmail = Auth.auth().currentUser?.email else {
            return nil
        }
    
        return .init(emails: currectSessionEmail)
    }
    
    
    func logOut() throws {
        try Auth.auth().signOut()
    }
    
    
    
    
}
