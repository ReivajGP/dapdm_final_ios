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
  private lazy var slideMenu: SlideMenuViewController = {
    let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
    
    guard let slideMenu: SlideMenuViewController = storyboard.instantiateViewController(withIdentifier: "SlideMenuViewController") as? SlideMenuViewController else {
      fatalError("Unable to Instantiate Summary View Controller")
    }
    
    self.setupSlideMenuView(with: slideMenu)
    
    return slideMenu
  }()
  
  // MARK: - IBOutlets
  @IBOutlet private weak var navigationBar: UINavigationBar!
  @IBOutlet private weak var leadingSlideViewConstraint: NSLayoutConstraint!
  @IBOutlet private weak var slideMenuContainer: UIView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    slideMenu.delegate = self
  }
  
  // MARK: - IBAction methods
  @objc private func openYoutube(_ sender: UIButton) {
  }
  
  @objc private func openInstagram(_ sender: UIButton) {
  }
  
  @objc private func openFacebook(_ sender: UIButton) {
  }
  
  @IBAction func showMenu(_ sender: UIBarButtonItem) {
    leadingSlideViewConstraint.constant = 0
  }
  
  // MARK: - Private methods
  private func setupView() {
    NavigationBarHelper().setupView(for: navigationBar)
    setupSlideMenuView(with: slideMenu)
  }
  
  private func setupSlideMenuView(with slideMenuViewController: UIViewController) {
    addChild(slideMenuViewController)
    slideMenuContainer.addSubview(slideMenuViewController.view)
    
    slideMenuViewController.view.translatesAutoresizingMaskIntoConstraints = false
    slideMenuViewController.view.bottomAnchor.constraint(equalTo: slideMenuContainer.safeAreaLayoutGuide.bottomAnchor).isActive = true
    slideMenuViewController.view.leadingAnchor.constraint(equalTo: slideMenuContainer.safeAreaLayoutGuide.leadingAnchor).isActive = true
    slideMenuViewController.view.trailingAnchor.constraint(equalTo: slideMenuContainer.safeAreaLayoutGuide.trailingAnchor).isActive = true
    slideMenuViewController.view.topAnchor.constraint(equalTo: slideMenuContainer.safeAreaLayoutGuide.topAnchor).isActive = true
    
    slideMenuViewController.didMove(toParent: self)
  }
}

extension HomeViewController: SlideMenuViewControllerDelegate {
  func hideSlideMenu() {
    leadingSlideViewConstraint.constant = -250
  }
}

