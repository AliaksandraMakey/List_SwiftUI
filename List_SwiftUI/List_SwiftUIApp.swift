//
//  List_SwiftUIApp.swift
//  List_SwiftUI
//
//  Created by AliaksandraHoman on 09/06/2023.
//

import SwiftUI

@main
struct List_SwiftUIApp: App {
    @StateObject var authentication = Authentication()
    
       var body: some Scene {
           WindowGroup {
               if authentication.isValidated {
                   ContentView()
                       .environmentObject(authentication)
               } else {
                   LoginView()
                       .environmentObject(authentication)
               }
           }
       }
}
