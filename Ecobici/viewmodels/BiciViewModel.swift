//
//  BiciViewModel.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import Foundation
class BiciViewModel:ObservableObject{
    
    private let biciRepositiry: BiciRepository
    @Published var stations:[Station] = []
    @Published var messageError:String?
    

    init(biciRepositiry: BiciRepository = BiciRepository()) {
        self.biciRepositiry = biciRepositiry
    }


    func consultarBicis() async {
    
       let response = try! await  biciRepositiry.consultar(endpoint: Endpoint.BICI)
        DispatchQueue.main.sync {
            let stations = try! response.get().network.stations
            let positionsFilter =   slice(arrayList: stations, limit: 50)
            self.stations = positionsFilter
        }
       
    }
    
    private func slice<T>(arrayList:[T], limit:Int) -> [T]{
        return Array(arrayList[..<limit])
    }
    
}
