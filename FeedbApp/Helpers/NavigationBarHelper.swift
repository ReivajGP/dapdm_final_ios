//
//  NavigationBarHelper.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 18/03/23.
//

import Foundation
import UIKit

final class NavigationBarHelper {
  
  // MARK: - Properties
  private let constants: AppConstants = AppConstants()
  
  // MARK: - Public methods
  func setupView(for bar: UINavigationBar) {
    bar.layer.cornerRadius = constants.newContractCardCornerRadius
    bar.layer.shadowColor = constants.newContractCardShadowColor
    bar.layer.shadowOpacity = constants.newContractCardShadowOpacity
    bar.layer.shadowOffset = constants.newContractCardShadowOffset
    bar.layer.shadowRadius = constants.newContractCardShadowRadius
  }
}
