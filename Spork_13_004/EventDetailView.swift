//
//  EventDetailView.swift
//  Spork_13_004
//
//  Created by Zachary Hagman on 11/26/19.
//  Copyright © 2019 Zachary Hagman. All rights reserved.
//

import SwiftUI

struct EventDetailView: View {

	var dateFormatter: DateFormatter {
		let formatter = DateFormatter()
		formatter.dateStyle = .medium
		formatter.timeStyle = .none
		formatter.timeZone = .autoupdatingCurrent
		formatter.calendar = .autoupdatingCurrent
		return formatter
	}

	@State private var birthDate = Date()

	var event: LoggedEvent

    var body: some View {
		ZStack {
			Color.pink
			VStack {
				DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
					Text("Select a date")
				}
				Text("Date is \(birthDate, formatter: dateFormatter)")
				Text(event.eventTitle!)
					.foregroundColor(.white)
					.fontWeight(.black)
			}
		}
    }
}
