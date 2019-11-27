//
//  ContentView.swift
//  Spork_13_004
//
//  Created by Zachary Hagman on 11/26/19.
//  Copyright © 2019 Zachary Hagman. All rights reserved.
//

import SwiftUI

struct ContentView: View {

	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(fetchRequest: LoggedEvent.getAllLoggedEvents()) var loggedEvents: FetchedResults<LoggedEvent>

	@State private var newEventToBeLogged = ""

    var body: some View {
		NavigationView {
			List {
				Section(header: Text("What Happened?")) {
					HStack {
						TextField("New Event", text: self.$newEventToBeLogged)
						Button(action: {
							let event = LoggedEvent(context: self.managedObjectContext)
							event.eventTitle = self.newEventToBeLogged
							event.createdAt = Date()
							do {
								try self.managedObjectContext.save()
							} catch {
								print(error)
							}

							self.newEventToBeLogged = ""
						}) {
							Image(systemName: "plus.circle.fill")
								.foregroundColor(.pink)
								.font(.largeTitle)
						}
					}
				}
				Section(header: Text("Past Events")) {
					ForEach(self.loggedEvents) { event in
						NavigationLink(destination: EventDetailView(event: event)) {
							LoggedEventView(eventTitle: event.eventTitle!, createdAt: "\(event.createdAt!)")
						}
					}.onDelete { indexSet in
						let deleteItem = self.loggedEvents[indexSet.first!]
						self.managedObjectContext.delete(deleteItem)
						do {
							try self.managedObjectContext.save()
						} catch {
							print(error)
						}
					}
				}
			}.navigationBarTitle(Text("Event Log"))
				.navigationBarItems(leading: EditButton())

		}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
