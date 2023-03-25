//
//  SlideMenuViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 20/03/23.
//

import UIKit

protocol SlideMenuViewControllerDelegate {
  func showIntroductionScreen()
  func showCommentsScreen()
}

final class SlideMenuViewController: UIViewController {
  
  // MARK: - Properties
  var delegate: SlideMenuViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  // MARK: - IBAction methods
  @IBAction func showIntroductionScreen(_ sender: UIButton) {
    delegate?.showIntroductionScreen()
  }
  
  @IBAction func showCommentsScreen(_ sender: UIButton) {
    delegate?.showCommentsScreen()
  }
}
