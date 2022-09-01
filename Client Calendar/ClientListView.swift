//
//  ClientListView.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/29/22.
//

import SwiftUI

struct ClientListView: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.last_name)
    ]) var clients: FetchedResults<Client>
    
    @State private var showingAddClient = false
    
    var body: some View {
        List {
            ForEach(clients) { client in
                NavigationLink {
                    VStack {
                        Text(client.phone ?? "No Phone")
                        Text(client.email ?? "No Email")
                        Text(client.notes ?? "Empty Notes")
                            .foregroundColor(.secondary)
                    }
                } label: {
                    Text(client.last_name ?? "Unknown Name")
                        .font(.headline)
                    Text(client.first_name ?? "Unknown Name")
                        .font(.headline)
                    }
                }
                .onDelete(perform: deleteClients)
            }
            .navigationTitle("Client List")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddClient.toggle()
                    } label: {
                        Label("Add Client", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showingAddClient) {
                AddClientView()
        }
    }
    
    func deleteClients(at offsets: IndexSet) {
        for offset in offsets {
            let client = clients[offset]
            moc.delete(client)
        }
        
        try? moc.save()
    }
}

struct ClientListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientListView()
    }
}
