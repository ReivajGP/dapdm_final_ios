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
  private var backgroundView: UIView = UIView()
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
    UIView.animate(withDuration: 0.3) {
      self.leadingSlideViewConstraint.constant = -250
      self.view.layoutIfNeeded()
    } completion: { status in
      UIView.animate(withDuration: 0.3) {
        self.leadingSlideViewConstraint.constant = 0
        self.view.layoutIfNeeded()
      } completion: { status in
        self.backgroundView.isHidden = false
      }
    }
    view.bringSubviewToFront(slideMenuContainer)
  }
  
  // MARK: - Private methods
  private func setupView() {
    NavigationBarHelper().setupView(for: navigationBar)
    setupBackgroundView()
    setupSlideMenuView(with: slideMenu)
  }
  
  private func setupBackgroundView() {
    view.addSubview(backgroundView)
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
    backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
    backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
    
    backgroundView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.3)
    backgroundView.isHidden = true
  }
  
  private func setupSlideMenuView(with slideMenuViewController: UIViewController) {
    leadingSlideViewConstraint.constant = -250
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
    UIView.animate(withDuration: 0.3) {
      self.leadingSlideViewConstraint.constant = 0
      self.view.layoutIfNeeded()
    } completion: { status in
      UIView.animate(withDuration: 0.3) {
        self.leadingSlideViewConstraint.constant = -250
        self.view.layoutIfNeeded()
      } completion: { status in
        self.backgroundView.isHidden = true
      }
    }
  }
}

