//
//  AppDelegate.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit
import Network
import FirebaseCore
import FirebaseAuth

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  // MARK: - Networking properties
  var isThereInternetConnection: Bool = false
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    // MARK: - Internet monitor
    let internetMonitor: NWPathMonitor = NWPathMonitor()
    internetMonitor.start(queue: DispatchQueue.global())
    internetMonitor.pathUpdateHandler = { handler in
      if handler.status == .satisfied { self.isThereInternetConnection = true }
    }
    FirebaseApp.configure()
    return true
  }

  // MARK: UISceneSession Lifecycle
  func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
  }

  func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
  }
}

