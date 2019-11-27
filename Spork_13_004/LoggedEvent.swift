//
//  LoggedEvent.swift
//  Spork_13_004
//
//  Created by Zachary Hagman on 11/26/19.
//  Copyright © 2019 Zachary Hagman. All rights reserved.
//

import Foundation
import CoreData

public class LoggedEvent: NSManagedObject, Identifiable {
	@NSManaged public var createdAt: Date?
	@NSManaged public var eventTitle: String?
	@NSManaged public var isGoodThing: String?
}

extension LoggedEvent {
	static func getAllLoggedEvents() -> NSFetchRequest<LoggedEvent> {

		let request: NSFetchRequest<LoggedEvent> = LoggedEvent.fetchRequest() as! NSFetchRequest<LoggedEvent>

		let sortDescriptor = NSSortDescriptor(key: "createdAt", ascending: false)

		request.sortDescriptors = [sortDescriptor]

		return request
	}
}
