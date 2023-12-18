//
//  ListBicisView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 17/12/23.
//

import SwiftUI

struct ListBicisView: View {
    
    var stations: [Station]
    
    @Binding var indexSelected: String
    
    var body: some View {
        
            Form{
                ForEach(stations, id: \.id ){ location in
                    Label(location.name, systemImage: "mappin.circle")
                        .onTapGesture{
                            indexSelected = location.id
                        }
                        .padding(10)
                }
            }
    }
}
