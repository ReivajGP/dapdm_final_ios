//
//  NewContractStepFourViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import UIKit
import MapKit

final class NewContractStepFourViewController: UIViewController, MKMapViewDelegate {
  
  // MARK: - Properties
  var fourthStepTicket: TicketItem = TicketItem()
  private let constants: AppConstants = AppConstants()
  private var eventCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D()
  
  // MARK: - IBOutlets
  @IBOutlet weak var mapView: MKMapView!
  @IBOutlet private weak var setsNumberPicker: UIPickerView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setsNumberPicker.delegate = self
    mapView.delegate = self
    setupView()
    setUpOnMapViewTap()
  }
  
  // MARK: - IBAction methods
  @IBAction func goToNextStep(_ sender: UIButton) {
    let pickerValueSelected: Int = setsNumberPicker.selectedRow(inComponent: .zero)
    fourthStepTicket.numberOfSets = constants.setsPickerValues[pickerValueSelected]
    fourthStepTicket.locationLatitude = eventCoordinates.latitude
    fourthStepTicket.locationLongitude = eventCoordinates.longitude
    goToFinalStep()
  }
  
  // MARK: - Overrided methods
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is NewContractFinalStepViewController {
      (segue.destination as! NewContractFinalStepViewController).finalStepTicket = fourthStepTicket
    }
  }
  
  // MARK: - Private methods
  private func setupView() {
    setsNumberPicker.selectRow(constants.setsPickerDefaultSelectedRow,
                               inComponent: .zero, animated: true)
    let mxCityCoordinates: CLLocationCoordinate2D = CLLocationCoordinate2D(
      latitude: constants.mxCityLattitude,
      longitude: constants.mxCityLongitude
    )
    mapView.setRegion(MKCoordinateRegion(
      center:mxCityCoordinates,
      latitudinalMeters:constants.defaultMapRegionLatitudinalMeters,
      longitudinalMeters:constants.defaultMapRegionLongitudinalMeters),
      animated: true
    )
    
    let mapPin:MKPointAnnotation = MKPointAnnotation()
    mapPin.coordinate = mxCityCoordinates
    mapView.addAnnotation(mapPin)
  }
  
  private func setUpOnMapViewTap() {
    let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.recognizeTapLocation(gestureRecognizer:)))
    mapView.addGestureRecognizer(tapGesture)
  }
  
  @objc private func recognizeTapLocation(gestureRecognizer: UIGestureRecognizer) {
    mapView.removeAnnotations(mapView.annotations)
    let tapPoint: CGPoint = gestureRecognizer.location(in: mapView)
    let userTapMapCoordinates: CLLocationCoordinate2D = mapView.convert(tapPoint, toCoordinateFrom: mapView)
    eventCoordinates = userTapMapCoordinates
    let userSelectionPin: MKPointAnnotation = MKPointAnnotation()
    userSelectionPin.coordinate = userTapMapCoordinates
    mapView.addAnnotation(userSelectionPin)
  }
  
  private func goToFinalStep() {
    let toFinalStepSegue: UIStoryboardSegue = UIStoryboardSegue(
      identifier: constants.newContractToFinalStepSegue,
      source: self,
      destination: NewContractFinalStepViewController()
    )
    prepare(for: toFinalStepSegue, sender: self)
    performSegue(withIdentifier: constants.newContractToFinalStepSegue, sender: self)
  }
}

// MARK: - PickerView extension
extension NewContractStepFourViewController: UIPickerViewDataSource, UIPickerViewDelegate {
  func numberOfComponents(in pickerView: UIPickerView) -> Int { constants.numberOfSetsPickerComponents }
  
  func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
    constants.maximumSetNumberToShow
  }
  
  func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
    constants.setsPickerRowsHeight
  }
  
  func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    String(constants.setsPickerValues[row])
  }
}
