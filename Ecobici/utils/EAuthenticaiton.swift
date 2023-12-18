//
//  EAuthenticaiton.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation

enum EAuthentication : String, Identifiable{
    
    case REGISTER
    case LOGIN
    
    var id: String{
        return rawValue
    }
    
}
