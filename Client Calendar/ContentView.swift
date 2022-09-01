//
//  ContentView.swift
//  Client Calendar
//
//  Created by Joshua Lee on 7/26/22.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var dateHolder: DateHolder
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.last_name)
    ]) var clients: FetchedResults<Client>
    
    @State private var showingAddClient = false
    //@State private var showingClientList = false
    @State private var showingCredits = false
    
    @Environment(\.openURL) var openURL
    
    var body: some View {
        NavigationView {
            VStack(spacing: 1) {
                MonthView()
                    .environmentObject(dateHolder)
                    .padding()
                weekStack
                calendarGrid
                Spacer()
                addStack
                Spacer()
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
    var weekStack: some View {
        HStack(spacing: 1) {
            Text("**Sun**").dayOfWeek()
            Text("**Mon**").dayOfWeek()
            Text("**Tue**").dayOfWeek()
            Text("**Wed**").dayOfWeek()
            Text("**Thu**").dayOfWeek()
            Text("**Fri**").dayOfWeek()
            Text("**Sat**").dayOfWeek()
        }
        
    }
    
    var calendarGrid: some View {
        VStack(spacing: 1) {
            let daysInMonth = CalendarData().daysinMonth(dateHolder.date)
            let firstDay = CalendarData().firstofMonth(dateHolder.date)
            let startingSpaces = CalendarData().weekDay(firstDay)
            let prevMonth = CalendarData().minMonth(dateHolder.date)
            let daysInPrevMonth = CalendarData().daysinMonth(prevMonth)
            ForEach(0..<6) {
                row in HStack(spacing: 1) {
                    ForEach(1..<8) {
                        column in
                        let count = column + (row * 7)
                        DayView(count: count, startingSpaces: startingSpaces, daysInMonth: daysInMonth, daysInPrevMonth: daysInPrevMonth)
                            .environmentObject(dateHolder)
                    }
                }
            }
        }
        //.frame(maxHeight: .infinity)
        // above: use l8r to reposition everything
        // edit: no, just use a spacer in the body :P
    }
    
    var addStack: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                NavigationLink(destination: ClientListView()) {
                    Text("Client List")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                Spacer()
                Button {
                    
                } label: {
                    Text("Add Event")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    
                } label: {
                    Text("All Events")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                Spacer()
                Button {
                    
                } label: {
                    Text("Edit Email")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            Spacer()
            HStack {
                Spacer()
                Button {
                    showingCredits.toggle()
                } label: {
                    Text("Credits")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                .sheet(isPresented: $showingCredits) {
                    CreditsView()
                }
                Spacer()
                Button {
                    openURL(URL(string: "https://github.com/FortressZero")!)
                } label: {
                    Text("Github")
                        .font(.headline)
                        .foregroundColor(.red)
                        .padding()
                }
                .buttonStyle(.bordered)
                Spacer()
            }
            Spacer()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Text {
    func dayOfWeek() -> some View {
        self.frame(maxWidth: .infinity)
            .padding(.top, 1)
            .lineLimit(1)
        // can't believe this works
    }
}
