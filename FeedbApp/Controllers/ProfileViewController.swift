//
//  ProfileViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit
import FirebaseAuth

final class ProfileViewController: UIViewController {
  
  // MARK: - Properties
  private let constants: AppConstants = AppConstants()
  
  // MARK: - IBOutlets
  @IBOutlet private weak var mailTextField: UITextField!
  @IBOutlet private weak var passTextField: UITextField!
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    stopActivityIndicator()
  }
  
  // MARK: - Overrided methods
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  // MARK: - Private methods
  private func showActivityIndicator() {
    DispatchQueue.main.async {
      self.activityIndicator.startAnimating()
    }
  }
  
  private func stopActivityIndicator() {
    DispatchQueue.main.async {
      self.activityIndicator.hidesWhenStopped = true
      self.activityIndicator.stopAnimating()
    }
  }
  
  private func areFieldsEntriesFilled() -> Bool {
    !(mailTextField.text?.count == .zero) && !(passTextField.text?.count == .zero)
  }
  
  private func showEmptyFieldsAlert() {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: constants.emptyFieldsAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self
    ) { _ in }
  }
  
  private func showIssueSigningInAlert(message: String) {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: message,
      action1Title: constants.genericOkActionTitle,
      controller: self
    ) { _ in }
  }
  
  private func showIssueLogingInAlert(message: String) {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: message,
      action1Title: constants.genericOkActionTitle,
      controller: self
    ) { _ in }
  }
  
  private func showIssueRecoveringPasswordAlert(message: String) {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: message,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  private func showSuccessfulSignInAlert() {
    AlertHelper().showAlert(
      title: constants.successfulSignInAlertTitle,
      message: constants.successfulSignInAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  private func showSuccessfulLogInAlert() {
    AlertHelper().showAlert(
      title: constants.successfulLogInAlertTitle,
      message: constants.successfulLogInAlertMessage,
      action1Title: constants.takeMeThereActionTitle,
      action2Title: constants.notForNowActionTitle,
      controller: self) { userSelection in
        if userSelection == .ok {
          _ = self.tabBarController?.selectedIndex = self.constants.contractsTabBarControllerIndex
        }
      }
  }
  
  private func showIntroduceEmailAlert() {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: constants.emptyEmailFieldAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  private func successfullySentPassRecoveryMailAlert() {
    AlertHelper().showAlert(
      title: constants.genericSuccessfulAlertTitle,
      message: constants.successfullySentRecoveryMailAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  private func successfullyLogedOutAlert() {
    AlertHelper().showAlert(
      title: constants.genericSuccessfulAlertTitle,
      message: constants.successfullyLogedOutAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  // MARK: - IBaction methods
  @IBAction func logIn(_ sender: UIButton) {
    if areFieldsEntriesFilled() {
      guard let email: String = mailTextField.text,
            let password: String = passTextField.text else { return }
      showActivityIndicator()
      Auth.auth().signIn(withEmail: email, password: password) { result, error in
        guard let _ = result,
              error == nil else {
          if let error {
            self.showIssueLogingInAlert(message: error.localizedDescription)
            self.stopActivityIndicator()
          }
          return
        }
        self.showSuccessfulLogInAlert()
        self.stopActivityIndicator()
      }
    } else {
      showEmptyFieldsAlert()
    }
  }
  
  
  @IBAction func signIn(_ sender: UIButton) {
    if areFieldsEntriesFilled() {
      guard let email: String = mailTextField.text,
            let password: String = passTextField.text else { return }
      showActivityIndicator()
      Auth.auth().createUser(withEmail: email, password: password) { result, error in
        guard let _ = result,
              error == nil else {
          if let error {
            self.showIssueSigningInAlert(message: error.localizedDescription)
            self.stopActivityIndicator()
          }
          return
        }
        self.showSuccessfulSignInAlert()
        self.stopActivityIndicator()
      }
    } else {
      showEmptyFieldsAlert()
    }
  }
  
  @IBAction func recoverPassword(_ sender: UIButton) {
    if (mailTextField.text?.count != .zero) {
      guard let mail: String = mailTextField.text else { return }
      showActivityIndicator()
      Auth.auth().sendPasswordReset(withEmail: mail) { error in
        self.stopActivityIndicator()
        if let error {
          self.showIssueRecoveringPasswordAlert(message: error.localizedDescription)
        } else {
          self.successfullySentPassRecoveryMailAlert()
        }
      }
    } else {
      showIntroduceEmailAlert()
    }
  }
  
  @IBAction func logOut(_ sender: UIButton) {
    do {
      try Auth.auth().signOut()
      successfullyLogedOutAlert()
    } catch { }
  }
}
