//
//  NewContractStepThreeViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import UIKit

final class NewContractStepThreeViewController: UIViewController {
  
  // MARK: - Properties
  var thirdStepTicket: TicketItem = TicketItem()
  private var constants: AppConstants = AppConstants()
  
  // MARK: - IBOutlets
  @IBOutlet weak var timePicker: UIDatePicker!
  
  // MARK: - IBAction methods
  @IBAction func goToNextStep(_ sender: UIButton) {
    thirdStepTicket.eventTime = getTimeString()
    goToFourthStep()
  }
  
  // MARK: - Overrided methods
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is NewContractStepFourViewController {
      (segue.destination as! NewContractStepFourViewController).fourthStepTicket = thirdStepTicket
    }
  }
  
  // MARK: - Private methods
  private func goToFourthStep() {
    let toStepFourSegue: UIStoryboardSegue = UIStoryboardSegue(
      identifier: constants.newContractThirdToFourthStepSegue,
      source: self,
      destination: NewContractStepFourViewController()
    )
    prepare(for: toStepFourSegue, sender: self)
    performSegue(withIdentifier: constants.newContractThirdToFourthStepSegue, sender: self)
  }
  
  private func getTimeString() -> String {
    let timeComponents: DateComponents = timePicker.calendar.dateComponents([.hour, .minute], from: timePicker.date)
    let hourString: String = formatHourString(hourInt: timeComponents.hour ?? .zero)
    let minuteString: String = formatMinuteString(minuteInt: timeComponents.minute ?? .zero)
    return "\(hourString):\(minuteString) hrs"
  }
  
  private func formatHourString(hourInt: Int) -> String {
    hourInt == .zero ? constants.doubleZeroString : String(hourInt)
  }
  
  private func formatMinuteString(minuteInt: Int) -> String {
    if minuteInt < constants.tenMinutes {
      if minuteInt == .zero {
        return constants.doubleZeroString
      } else {
        return "0\(minuteInt)"
      }
    }
    return String(minuteInt)
  }
}
