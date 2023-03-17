//
//  DataPersistanceHelper.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 17/03/23.
//

import Foundation

final class DataPersistanceHelper {
  // MARK: - Properties
  private let constants: AppConstants = AppConstants()
  
  // MARK: - Public methods
  func isContractionFinished() -> Bool {
//    UserDefaults.standard.bool(forKey: constants.contractKeyUserDefaults)
    true
  }
  
  func setNewContractInProgressFlag(with value: Bool) {
//    UserDefaults.standard.set(value, forKey: constants.contractKeyUserDefaults)
//    UserDefaults.standard.synchronize()
  }
}
