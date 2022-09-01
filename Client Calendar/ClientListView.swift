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
    
    @State private var searchClient = ""
    
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
            .searchable(text: $searchClient)
            .navigationTitle("Client List")
            .onChange(of: searchClient) { newValue in
                clients.nsPredicate = searchPredicate(searchClient: newValue)
            }
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
    
    func searchPredicate(searchClient: String) -> NSPredicate? {
        if searchClient.isEmpty {return nil}
        return NSPredicate(format: "%K BEGINSWITH[cd] %@", #keyPath(Client.last_name), searchClient)
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
