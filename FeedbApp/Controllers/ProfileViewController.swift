//
//  ProfileViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit

final class ProfileViewController: UIViewController {
  
  // MARK: - IBOutlets
  @IBOutlet private weak var mailTextField: UITextField!
  @IBOutlet private weak var passTextField: UITextField!
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
}
