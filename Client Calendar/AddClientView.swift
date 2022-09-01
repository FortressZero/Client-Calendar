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
    @State private var last_name = ""
    @State private var first_name = ""
    @State private var email = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("First name", text: $first_name)
                    TextField("Last name", text: $last_name)
                    TextField("Phone", text: $phone)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                    TextField("Notes", text: $notes)
                }
                Section {
                    Button("Save") {
                        let newClient = Client(context: moc)
                        newClient.first_name = first_name
                        newClient.last_name = last_name
                        newClient.phone = phone
                        newClient.email = email
                        newClient.notes = notes
                        
                        do {
                            try moc.save()
                        } catch {
                            print(error.localizedDescription)
                        }
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
