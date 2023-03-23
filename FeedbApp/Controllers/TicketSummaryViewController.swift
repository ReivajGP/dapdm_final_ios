//
//  TicketSummaryViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 21/03/23.
//

import UIKit
import MapKit

final class TicketSummaryViewController: UIViewController {
  
  // MARK: - Properties
  var ticketToShow: TicketItem?
  
  // MARK: - IBOutlets
  @IBOutlet private weak var numberLabel: UILabel!
  @IBOutlet private weak var contactNameLabel: UILabel!
  @IBOutlet private weak var contactPhoneLabel: UILabel!
  @IBOutlet private weak var dateLabel: UILabel!
  @IBOutlet private weak var timeLabel: UILabel!
  @IBOutlet private weak var setsNumberLabel: UILabel!
  @IBOutlet private weak var detailsLabel: UILabel!
  @IBOutlet private weak var amountPaidLabel: UILabel!
  @IBOutlet private weak var profileImageView: UIImageView!
  @IBOutlet private weak var mapView: MKMapView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - Private methods
  private func setupView() {
    setupLabels()
    setupProfileImage()
    setupMap()
  }
  
  private func setupProfileImage() {
    
  }
  
  private func setupLabels() {
    guard let ticketToShow else { return }
    numberLabel.text = ticketToShow.ticketNumber
    contactNameLabel.text = ticketToShow.contactName
    contactPhoneLabel.text = ticketToShow.contactPhone
    dateLabel.text = ticketToShow.eventDate
    timeLabel.text = ticketToShow.eventTime
    setsNumberLabel.text = "\(ticketToShow.numberOfSets) turnos"
    amountPaidLabel.text = "$\(ticketToShow.paidAmount) de $\(ticketToShow.totalAmount)"
  }
  
  private func setupMap() {
    guard let ticketToShow else { return }
  }
}
