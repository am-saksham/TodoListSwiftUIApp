//
//  TodoListApp.swift
//  TodoList
//
//  Created by Saksham Gupta on 08/06/24.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for views
 */

@main
struct TodoListApp: App {
    
    @State var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                ListView()
            }
            .environment(listViewModel)
        }
    }
}
