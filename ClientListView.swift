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
        SortDescriptor(\.name)
    ]) var clients: FetchedResults<Client>
    
    var body: some View {
        NavigationView {
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
                        Text(client.name ?? "Unknown Name")
                            .font(.headline)
                        }
                    }
                }
            }
            .navigationTitle("Client List")
        }
    }

struct ClientListView_Previews: PreviewProvider {
    static var previews: some View {
        ClientListView()
    }
}
