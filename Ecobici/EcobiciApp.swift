//
//  EcobiciApp.swift
//  Ecobici
//
//  Created by Nelson Gustavo Ek Perera on 16/12/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct EcobiciApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModels = AuthenticationViewModel()
    
    var body: some Scene {
        
        WindowGroup {
            
            if let _ = authenticationViewModels.user{
                HomeMapView(authenticationvieModel: authenticationViewModels)
            }else{
                AuthenticationView(authenticationViewModel: authenticationViewModels)
            }
        
            
        }
    }
}
