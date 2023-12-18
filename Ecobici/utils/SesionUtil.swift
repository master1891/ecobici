//
//  SesionUtil.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation
class SesionUtil {
    
    
    static func executeApi (endpoint:Endpoint) async -> Result<BiciResponse, MessageError>  {
      
        do{
            
            let url = URL(string: endpoint.rawValue)!
            let (data, _) = try! await URLSession.shared.data(from: url)
            
            let response = try! JSONDecoder().decode(BiciResponse.self, from: data)
            return Result.success(response)
            
        }catch let error{
            return Result.failure(MessageError(message: error.localizedDescription))
            
        }
        
    }
    
}


