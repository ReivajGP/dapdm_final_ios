//
//  NewContractStepOneViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import UIKit

final class NewContractStepOneViewController: UIViewController {

  //MARK: - Properties
  private var constants: AppConstants = AppConstants()
  private var stepOneTicket: TicketItem = TicketItem()
  
  //MARK: - IBOutlets
  @IBOutlet private weak var nameTextField: UITextField!
  @IBOutlet private weak var phoneTextField: UITextField!
  
  // MARK: - IBActions
  @IBAction private func goToNextStep(_ sender: UIButton) {
    if areFieldsEntriesFilled() {
      stepOneTicket.contactName = nameTextField.text ?? ""
      stepOneTicket.contactPhone = phoneTextField.text ?? ""
      goToSecondStep()
    } else {
      AlertHelper().showAlert(
        title: constants.genericAlertTitle,
        message: constants.emptyFieldsAlertMessage,
        action1Title: constants.genericOkActionTitle,
        controller: self
      ) { _ in }
    }
  }
  
  // MARK: - Overrided methods
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is NewContractStepTwoViewController {
      (segue.destination as! NewContractStepTwoViewController).secondStepTicket = stepOneTicket
    }
  }
  
  // MARK: - Private methods
  private func areFieldsEntriesFilled() -> Bool {
    !(nameTextField.text?.count == .zero) && !(phoneTextField.text?.count == .zero)
  }
  
  private func goToSecondStep() {
    let toStepTwoSegue: UIStoryboardSegue = UIStoryboardSegue(
      identifier: constants.newContractOneToSecondStepSegue,
      source: self,
      destination: NewContractStepTwoViewController()
    )
    prepare(for: toStepTwoSegue, sender: self)
    performSegue(withIdentifier: constants.newContractOneToSecondStepSegue, sender: self)
  }
}
