//
//  HomeMapView.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import SwiftUI
import MapKit

struct HomeMapView: View {
    
    @ObservedObject var authenticationvieModel: AuthenticationViewModel
    @StateObject var biciViewModel: BiciViewModel = BiciViewModel()
    @State var showMainList = false
    @State var indexSelected = ""
    
    
    
    private func consultarData() async{
        await biciViewModel.consultarBicis()
        if(biciViewModel.stations.count > 0){
            showMainList = true
        }
    }
    
    private func getStationSelected(index:Array<Int>.Index) ->Station{
        return biciViewModel.stations[index]
    }
    

    var body: some View {
        
        NavigationView{
            VStack{
                Map{
                    
                    if let indexStation = biciViewModel.stations.firstIndex(where: {$0.id == indexSelected}) {
                        let stationSelected = getStationSelected(index: indexStation)
                        Marker(stationSelected.name, coordinate: CLLocationCoordinate2D(latitude: stationSelected.latitude, longitude: stationSelected.longitude))
                    }
                }.onAppear{
                    Task{
                        await consultarData()
                    }
                }.sheet(isPresented: $showMainList , onDismiss: {
                    indexSelected = ""
                    showMainList = false
                    biciViewModel.stations = []
                    Task{
                        await consultarData()
                    }
                    
                }, content: {
                    
                    
                    if(biciViewModel.stations.count > 0 && indexSelected.isEmpty){
                        ListBicisView(stations: biciViewModel.stations,indexSelected: $indexSelected).presentationDetents([
                            .fraction(0.3),
                            .large
                        ])
                    }
                    else{
                        if(indexSelected.count > 0){
                            if let indexStation = biciViewModel.stations.firstIndex(where: {$0.id == indexSelected}) {
                                
                                let stationselected =  getStationSelected(index: indexStation)
                                
                                DetailBici(station: stationselected).presentationDetents([
                                    .fraction(0.3),
                                    .medium
                                ])
                            }
                        }
                    }
                    
                })
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("Ubicaciones")
                .toolbar{
                    Button("Logout"){
                        authenticationvieModel.signOut()
                    }
                }
            }
        }
        
    }
}



