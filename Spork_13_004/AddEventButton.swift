//
//  TestButton.swift
//  Spork_13_004
//
//  Created by Zachary Hagman on 11/26/19.
//  Copyright © 2019 Zachary Hagman. All rights reserved.
//

import SwiftUI

struct AddEventButton: View {
	@Environment(\.managedObjectContext) var managedObjectContext
	@FetchRequest(fetchRequest: LoggedEvent.getAllLoggedEvents()) var loggedEvents: FetchedResults<LoggedEvent>

	@State private var newEventToBeLogged = ""
	
    var body: some View {
		Button(action: {
			let event = LoggedEvent(context: self.managedObjectContext)
			event.eventTitle = self.newEventToBeLogged
			do {
				try self.managedObjectContext.save()
			} catch {
				print(error)
			}

			self.newEventToBeLogged = ""
		}) {
			Image(systemName: "plus.circle.fill")
				.foregroundColor(.black)
				.font(.largeTitle)
		}
    }
}

struct TestButton_Previews: PreviewProvider {
    static var previews: some View {
        AddEventButton()
    }
}
