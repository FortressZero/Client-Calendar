//
//  AddClientView.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/28/22.
//

import SwiftUI

struct AddClientView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var phone = ""
    @State private var notes = ""
    @State private var name = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Client name", text: $name)
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                    TextField("Notes", text: $notes)
                }
                Section {
                    Button("Save") {
                        let newClient = Client(context: moc)
                        newClient.name = name
                        newClient.phone = phone
                        newClient.email = email
                        newClient.notes = notes
                        
                        try? moc.save()
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add Client")
        }
    }
}

struct AddClientView_Previews: PreviewProvider {
    static var previews: some View {
        AddClientView()
    }
}
