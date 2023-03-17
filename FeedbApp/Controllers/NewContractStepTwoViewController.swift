//
//  NewContractStepTwoViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import UIKit

final class NewContractStepTwoViewController: UIViewController {
  
  // MARK: - Properties
  private var constants: AppConstants = AppConstants()
  var secondStepTicket: TicketItem = TicketItem()
  
  // MARK: - IBOutlets
  @IBOutlet private weak var datePicker: UIDatePicker!
  
  // MARK: - Overrided methods
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is NewContractStepThreeViewController {
      (segue.destination as! NewContractStepThreeViewController).thirdStepTicket = secondStepTicket
    }
  }
  
  // MARK: - IBAction methods
  @IBAction private func goToNextStep(_ sender: UIButton) {
    secondStepTicket.eventDate = getDateString()
    goToThirdStep()
  }
  
  // MARK: - Private methods
  private func goToThirdStep() {
    let toStepThreeSegue: UIStoryboardSegue = UIStoryboardSegue(
      identifier: constants.newContractSecondToThirdStepSegue,
      source: self,
      destination: NewContractStepThreeViewController()
    )
    prepare(for: toStepThreeSegue, sender: self)
    performSegue(withIdentifier: constants.newContractSecondToThirdStepSegue, sender: self)
  }
  
  private func getDateString() -> String {
    let dateComponents: DateComponents = datePicker.calendar.dateComponents([.day, .month, .year], from: datePicker.date)
    let dayString: String = String(dateComponents.day ?? .zero)
    let monthString: String = getMonthString(for: dateComponents.month ?? .zero)
    let yearString: String = String(dateComponents.year ?? .zero)
    return "\(dayString)/\(monthString)/\(yearString)"
  }
  
  private func getMonthString(for monthNumber: Int) -> String {
    switch monthNumber {
      case constants.januaryNumber: return constants.januaryString
      case constants.februaryNumber: return constants.februaryString
      case constants.marchNumber: return constants.marchString
      case constants.aprilNumber: return constants.aprilString
      case constants.mayNumber: return constants.mayString
      case constants.juneNumber: return constants.juneString
      case constants.julyNumber: return constants.julyString
      case constants.augustNumber: return constants.augustString
      case constants.septemberNumber: return constants.septemberString
      case constants.octoberNumber: return constants.octoberString
      case constants.novemberNumber: return constants.novemberString
      case constants.decemberNumber: return constants.decemberString
      default: return ""
    }
  }
}
