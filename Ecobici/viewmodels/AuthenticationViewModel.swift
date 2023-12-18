//
//  AuthenticationViewModel.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation

class AuthenticationViewModel:ObservableObject{
    
    private let authenticationRepositiry:AuthRepository
    @Published var user:Usuario?
    @Published var messageError:String?
    
    
    init(authenticationRepositiry: AuthRepository = AuthRepository()) {
        self.authenticationRepositiry = authenticationRepositiry
        getCurrectUser()
    }
    
   
    func createNewUser(email:String,password:String) {
        authenticationRepositiry.createNewUser(email: email, password: password) {  [weak self] result in
            switch result{
            case .success(let usuario):
                self?.user = usuario
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func login(email:String,password:String) {
        authenticationRepositiry.login(email: email, password: password) {  [weak self] result in
            switch result{
            case .success(let usuario):
                self?.user = usuario
            case .failure(let error):
                self?.messageError = error.localizedDescription
            }
        }
    }
    
    func getCurrectUser() {
        self.user = authenticationRepositiry.getCurrectUser()
    }
    
    func signOut() {
        do{
            try authenticationRepositiry.signOut()
            user = nil
        }catch{
            print("Error en el deslogueo")
        }
        
    }
    
}
