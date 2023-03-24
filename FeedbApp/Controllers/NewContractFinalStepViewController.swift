//
//  NewContractFinalStepViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 16/03/23.
//

import UIKit
import Lottie

final class NewContractFinalStepViewController: UIViewController {
  
  // MARK: - Properties
  var finalStepTicket: TicketItem = TicketItem()
  let constants: AppConstants = AppConstants()
  
  // MARK: - IBOutlets
  @IBOutlet private weak var animationContainer: UIView!
  @IBOutlet private weak var nextStepsTextView: UITextView!
  
  // MARK: - Lifecycle methods
  override func viewDidLoad() {
    super.viewDidLoad()
    print(finalStepTicket)
    setupView()
    launchAnimation()
  }
  
  // MARK: - Overrided methods
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.destination is NewContractStepFourViewController {
      dismiss(animated: true)
    }
  }
  
  // MARK: - Private methods
  private func setupView() {
    setupTextView()
    launchAnimation()
  }
  
  private func setupTextView() {
    let textViewStyle = NSMutableParagraphStyle()
    textViewStyle.lineSpacing = -5
    textViewStyle.alignment = .center
    let attributes = [NSAttributedString.Key.paragraphStyle : textViewStyle,
                      NSAttributedString.Key.font: UIFont(name: "Hiragino Sans", size: 18.0) ?? UIFont()]
    nextStepsTextView.attributedText = NSAttributedString(
      string: constants.newContractNextStepInstructions,
      attributes: attributes
    )
  }
  
  private func launchAnimation() {
    let animationView: LottieAnimationView = LottieAnimationView(name: constants.animationApprovedName)
    animationView.frame = animationContainer.frame
    animationView.center = animationContainer.center
    animationView.contentMode = .scaleAspectFit
    animationView.loopMode = .loop
    animationView.animationSpeed = constants.defaultAnimationSpeed
    animationView.play()
    view.addSubview(animationView)
    animationView.translatesAutoresizingMaskIntoConstraints = false
    animationView.centerXAnchor.constraint(equalTo: animationContainer.centerXAnchor).isActive = true
    animationView.centerYAnchor.constraint(equalTo: animationContainer.centerYAnchor).isActive = true
    animationView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width).isActive = true
    animationView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height).isActive = true
  }
}
