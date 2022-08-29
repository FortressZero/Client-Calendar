//
//  MonthView.swift
//  Client Calendar
//
//  Created by Joshua Lee on 8/27/22.
//

import SwiftUI

struct MonthView: View {
    @EnvironmentObject var dateHolder: DateHolder
    
    func prevMonth() {
        dateHolder.date = CalendarData().minMonth(dateHolder.date)
    }
    
    func nextMonth() {
        dateHolder.date = CalendarData().addMonth(dateHolder.date)
    }
    
    var body: some View {
        HStack {
            Spacer()
            Button(action: prevMonth) {
                Image(systemName: "arrowshape.turn.up.left.circle")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(Color(.systemRed))
            }
            Text(CalendarData().monthYearString(dateHolder.date))
                .font(.title)
                .bold()
                .animation(.none)
                .frame(maxWidth: .infinity)
            Button(action: nextMonth) {
                Image(systemName: "arrowshape.turn.up.right.circle")
                    .imageScale(.large)
                    .font(Font.title.weight(.bold))
                    .foregroundColor(Color(.systemRed))
            }
            Spacer()
        }
            
        
    }
}

struct MonthView_Previews: PreviewProvider {
    static var previews: some View {
        MonthView()
    }
}
