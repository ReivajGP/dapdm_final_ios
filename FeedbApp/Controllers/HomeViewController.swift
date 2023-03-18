//
//  ViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit

final class HomeViewController: UIViewController, UINavigationBarDelegate {

  // MARK: - Properties
  private let constants: AppConstants = AppConstants()
  
  // MARK: - IBOutlets
  @IBOutlet private weak var navigationBar: UINavigationBar!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  // MARK: - IBAction methods
  @objc private func openYoutube(_ sender: UIButton) {
  }
  
  @objc private func openInstagram(_ sender: UIButton) {
  }
  
  @objc private func openFacebook(_ sender: UIButton) {
  }
  
  @IBAction func showMenu(_ sender: UIBarButtonItem) {
  }
  
  // MARK: - Private methods
  private func setupView() {
    NavigationBarHelper().setupView(for: navigationBar)
  }
}

