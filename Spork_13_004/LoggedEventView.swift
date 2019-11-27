//
//  LoggedEventView.swift
//  Spork_13_004
//
//  Created by Zachary Hagman on 11/26/19.
//  Copyright © 2019 Zachary Hagman. All rights reserved.
//

import SwiftUI

struct LoggedEventView: View {
	var dateToString: DateFormatter {
		let formatter = DateFormatter()
		formatter.calendar = .autoupdatingCurrent
		formatter.timeZone = .autoupdatingCurrent
		formatter.timeStyle = .medium
		formatter.dateStyle = .medium
		return formatter
	}

	var eventTitle: String = ""
	var createdAt: String = ""

    var body: some View {
		HStack {
			VStack(alignment: .leading) {
				Text(eventTitle)
					.font(.headline)
				Text(createdAt)
					.font(.caption)
					.foregroundColor(.secondary)
			}
		}
    }
}

struct LoggedEventView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedEventView()
    }
}
