//
//  SlideMenuBaseViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 20/03/23.
//

import UIKit

final class SlideMenuBaseViewController: UIViewController {
  
  // MARK: - Properties
  var slideMenuViewController: SlideMenuViewController?
  
  // MARK: - IBOutlets
  @IBOutlet weak var menuView: UIView!
  @IBOutlet weak var menuBackgroundView: UIView!
  @IBOutlet weak var leadingSlideViewConstraint: NSLayoutConstraint!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    menuBackgroundView.isHidden = true 
  }
  
  @IBAction func showMenu(_ sender: UIButton) {
    menuBackgroundView.isHidden = false
    leadingSlideViewConstraint.constant = 0
  }
}
