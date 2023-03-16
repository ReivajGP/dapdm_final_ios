//
//  CalendarItem.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation

struct CalendarItem: Codable {
  var title: String
  var description: String
  var schedule: String
  var image: String
  var additionalInfo: String?
}
