//
//  CommentsViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 24/03/23.
//

import UIKit

final class CommentsViewController: UIViewController {

  // MARK: - Properties
  let constants: AppConstants = AppConstants()
  let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
  
  // MARK: - IBOutlets
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet weak var commentsTextView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  // MARK: - Overrided methods
  override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    view.endEditing(true)
  }
  
  // MARK: - Private methods
  private func setupView() {
    stopActivityIndicator()
    commentsTextView.text = String()
    commentsTextView.becomeFirstResponder()
  }
  
  private func stopActivityIndicator() {
    DispatchQueue.main.async {
      self.activityIndicator.hidesWhenStopped = true
      self.activityIndicator.stopAnimating()
    }
  }
  
  private func showCommentsSentSuccessfullyAlert() {
    AlertHelper().showAlert(
      title: constants.genericSuccessfulAlertTitle,
      message: constants.commentsSentSuccessfullyAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in
        self.dismiss(animated: true)
      }
  }
  
  private func showEmptyFieldsAlert() {
    AlertHelper().showAlert(
      title: constants.genericIssueAlertTitle,
      message: constants.emptyFieldsAlertMessage,
      action1Title: constants.genericOkActionTitle,
      controller: self) { _ in }
  }
  
  // MARK: - IBAction methods
  @IBAction func sendComments(_ sender: UIButton) {
    if commentsTextView.text.count != .zero {
      if appDelegate.isThereInternetConnection {
        activityIndicator.startAnimating()
        guard let commentsURL: URL = URL(string: constants.baseUrl + constants.commentsEndpoint)
        else {
          stopActivityIndicator()
          return
        }
        URLSession.shared.dataTask(with: URLRequest(url: commentsURL)) { _, response, error in
          self.stopActivityIndicator()
          if error == nil {
            DispatchQueue.main.async {
              self.showCommentsSentSuccessfullyAlert()
            }
          }
        }.resume()
      } else {
        AlertHelper().showNoInternetConnectionAlert(in: self)
      }
    } else {
      showEmptyFieldsAlert()
    }
  }
}
