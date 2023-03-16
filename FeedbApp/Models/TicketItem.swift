//
//  TicketItem.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation

struct TicketItem: Codable {
  var ticketNumber: String
  var ticketStatus: Int
  var contactName: String
  var contactPhone: String
  var contactPhoto: String
  var eventDate: String
  var eventTime: String
  var numberOfSets: Int
  var totalAmount: Double
  var paidAmount: Double
  var locationLatitude: Double
  var locationLongitude: Double
  var additionalComments: String? = nil
}
