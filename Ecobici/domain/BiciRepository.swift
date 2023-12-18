//
//  BiciRepository.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation

class BiciRepository{
    
    func consultar(endpoint:Endpoint) async -> Result<BiciResponse,MessageError>{
        return await SesionUtil.executeApi(endpoint: endpoint)
    }
}
