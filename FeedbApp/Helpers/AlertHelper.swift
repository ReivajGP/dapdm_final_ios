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
      let alertAction2: UIAlertAction = UIAlertAction(title: action2Title, style: .default)
      alert.addAction(alertAction2)
    }
    controller.present(alert, animated: true)
  }
}
