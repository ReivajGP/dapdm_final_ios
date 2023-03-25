//
//  AlertHelper.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import Foundation
import UIKit

final class AlertHelper {
  
  func showAlert(title: String,
                 message: String,
                 action1Title: String,
                 action2Title: String? = nil,
                 controller: UIViewController,
                 completion: @escaping (AlertActionType) -> Void)
  {
    let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let alertAction: UIAlertAction = UIAlertAction(title: action1Title, style: .default) { _ in completion (.ok) }
    alert.addAction(alertAction)
    if let action2Title {
      let alertAction2: UIAlertAction = UIAlertAction(title: action2Title, style: .default) { _ in completion (.notForNow)}
      alert.addAction(alertAction2)
    }
    controller.present(alert, animated: true)
  }
  
  func showNoInternetConnectionAlert(in viewController: UIViewController) {
    let alert: UIAlertController = UIAlertController(
      title: AppConstants().noInternetConnectionAlertTitle,
      message: AppConstants().noInternetConnectionAlertMessage,
      preferredStyle: .alert
    )
    let alertAction: UIAlertAction = UIAlertAction(title: AppConstants().genericOkActionTitle, style: .default) { _ in }
    alert.addAction(alertAction)
    viewController.present(alert, animated: true)
  }
  
  func showServiceUnavailableAlert(in viewController: UIViewController) {
    let alert: UIAlertController = UIAlertController(
      title: AppConstants().genericIssueAlertTitle,
      message: AppConstants().serviceUnavailableAlertMessage,
      preferredStyle: .alert
    )
    let alertAction: UIAlertAction = UIAlertAction(title: AppConstants().genericOkActionTitle, style: .default) { _ in }
    alert.addAction(alertAction)
    viewController.present(alert, animated: true)
  }
}
