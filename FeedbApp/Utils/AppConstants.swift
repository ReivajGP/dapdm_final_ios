//
//  AppConstants.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation
import UIKit

struct AppConstants {
  // MARK: - URL's
  var baseUrl: String { "https://private-5acf0e-feedbapp.apiary-mock.com" }
  var calendarEndpoint = "/events"
  var ticketsEndpoint = "/tickets"
  var commentsEndpoint = "/comments"
  
  // MARK: Contract screen
  var newContractCardCornerRadius: CGFloat { 10.0 }
  var newContractCardShadowColor: CGColor { UIColor.black.cgColor }
  var newContractCardShadowOpacity: Float { 0.3 }
  var newContractCardShadowOffset: CGSize { .zero }
  var newContractCardShadowRadius: CGFloat { 5.0 }
  var ticketCellReusableID: String { "ticketCellReusableID" }
  var expiredTicketImageName: String { "ticket_expired" }
  var okTicketImageName: String { "ticket_ok" }
  var ticketCellNib: String { "TicketTableViewCell" }
  
  
  // MARK: - Calendar screen
  var calendarCellReusableID: String { "calendarCellReusableID" }
  
}
