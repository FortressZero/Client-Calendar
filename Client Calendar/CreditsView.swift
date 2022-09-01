//
//  CreditsView.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/28/22.
//

import SwiftUI

struct CreditsView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Spacer()
        Text("Created by Joshua Lee")
        Spacer()
        Text("Dedicated to my Mom")
        Spacer()
        Button("Return") {
            dismiss()
        }
        .foregroundColor(.red)
        .buttonStyle(.bordered)
        Spacer()
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
    }
}
