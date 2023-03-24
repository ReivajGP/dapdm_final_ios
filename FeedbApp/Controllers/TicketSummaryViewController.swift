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
  let constants: AppConstants = AppConstants()
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
    setupView()
  }
  
  // MARK: - Private methods
  private func setupView() {
    setupLabels()
    setupProfileImage()
    setupMap()
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
    if let additionalComments: String = ticketToShow.additionalComments {
      detailsLabel.text = additionalComments
    } else {
      detailsLabel.text = "(Sin notas adicionales)"
    }
  }
  
  private func setupMap() {
    guard let ticketToShow else { return }
    
    let mxCityCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(
      latitude: ticketToShow.locationLatitude,
      longitude: ticketToShow.locationLongitude
    )
    mapView.setRegion(MKCoordinateRegion(
      center: mxCityCoordinates,
      latitudinalMeters: constants.defaultMapRegionLatitudinalMeters,
      longitudinalMeters: constants.defaultMapRegionLongitudinalMeters),
      animated: true
    )
    
    let mapPin:MKPointAnnotation = MKPointAnnotation()
    mapPin.coordinate = mxCityCoordinates
    mapView.addAnnotation(mapPin)
    mapView.isUserInteractionEnabled = false
  }
  
  func setupProfileImage(){
    guard let URL: URL = URL(string: ticketToShow?.contactPhoto ?? "") else { return }
    URLSession.shared.dataTask(with: URLRequest(url: URL)) { imageData, _, error in
      if error == nil,
      let imageData {
        DispatchQueue.main.async {
          self.profileImageView.image = UIImage(data: imageData)
        }
      }
    }.resume()
  }
}
