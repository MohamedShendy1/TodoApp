//
//  TODO_sAppApp.swift
//  TODO'sApp
//
//  Created by Mohamed Shendy on 11/09/2024.
//

import SwiftUI

@main
struct TODO_sAppApp: App {
    @StateObject var listViewModel: ListViewModel = ListViewModel()

    var body: some Scene {
                
        WindowGroup {
            NavigationStack{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
