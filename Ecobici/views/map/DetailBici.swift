//
//  DetailBici.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 17/12/23.
//

import SwiftUI

struct DetailBici: View {
    
    var station: Station
    
    var body: some View {
        VStack{
            DismissView()
            
            HStack{
                Text(station.name)
                    .multilineTextAlignment(.center)
                    .bold()
                    .font(.system(size: 20))
                    
            }
            
            Rectangle()
                .frame(height: 0.2)
                .foregroundColor(.gray)
           
            Text("Espacios vacios \(station.empty_slots)")
            Text("Bicicletas disponiblea \(station.free_bikes)")
            
            HStack{
                
                    Button(action: {
                        //Hacer algo
                    }, label: {
                        VStack {
                            Image(systemName: "mappin") // Aquí va el nombre del ícono
                                .font(.title)
                            Text("Lat: \(station.latitude)")
                                .fontWeight(.semibold)
                                .font(.system(size: 14))
                        }
                    })
                    .buttonStyle(.bordered)
                    .tint(.blue)
                   
                    //Segundo boton
                    Button(action: {
                        //Hacer algo
                    }, label: {
                        VStack {
                            Image(systemName: "mappin") // Aquí va el nombre del ícono
                                .font(.title)
                            Text("Lng: \(station.longitude)")
                                .fontWeight(.semibold)
                                .font(.system(size: 16))
                        }
                    })
                    .buttonStyle(.bordered)
                    .tint(.black)
            }
            
        }
        
    }
}

