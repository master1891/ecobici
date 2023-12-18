//
//  BiciResponse.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//


import Foundation

struct BiciResponse: Decodable {
  let network: Network
    
}

struct Network: Decodable {
  let stations: [Station]
}

 struct Station: Decodable {
  let empty_slots: Int
  let free_bikes: Int
  let id: String
  let latitude: Double
  let longitude: Double
  let name: String
  let timestamp: String
}

