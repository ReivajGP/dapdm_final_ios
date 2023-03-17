//
//  TicketItem.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation

struct TicketItem: Codable {
  var ticketNumber: String = ""
  var ticketStatus: Int = .zero
  var contactName: String = ""
  var contactPhone: String = ""
  var contactPhoto: String = ""
  var eventDate: String = ""
  var eventTime: String = ""
  var numberOfSets: Int = .zero
  var totalAmount: Double = .zero
  var paidAmount: Double = .zero
  var locationLatitude: Double = .zero
  var locationLongitude: Double = .zero
  var additionalComments: String? = nil
}
