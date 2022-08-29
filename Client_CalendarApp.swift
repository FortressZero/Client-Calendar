//
//  Client_CalendarApp.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/26/22.
//

import SwiftUI

@main
struct Client_CalendarApp: App {
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            let dateHolder = DateHolder()
            ContentView()
                .environmentObject(dateHolder)
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
