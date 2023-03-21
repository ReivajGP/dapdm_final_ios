//
//  SlideMenuViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 20/03/23.
//

import UIKit

protocol SlideMenuViewControllerDelegate {
  func hideSlideMenu()
}

final class SlideMenuViewController: UIViewController {
  
  // MARK: - Properties
  var delegate: SlideMenuViewControllerDelegate?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupSlideMenuView()
  }
  
  // MARK: - Private methods
  private func setupSlideMenuView() {
    
  }
  
  // MARK: - IBAction methods
  @IBAction func showIntroductionScreen(_ sender: UIButton) {
    delegate?.hideSlideMenu()
  }
  
  @IBAction func showCommentsScreen(_ sender: UIButton) {
    delegate?.hideSlideMenu()
  }
}
