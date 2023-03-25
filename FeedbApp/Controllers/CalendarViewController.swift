//
//  CalendarViewController.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit

final class CalendarViewController: UIViewController {

  // MARK: - Properties
  private var areImagesDownloaded: Bool = false
  private var events: [CalendarItem] = []
  private var eventsImagesData: [Data] = []
  private let constants: AppConstants = AppConstants()
  private let imageDownloaderHelper: ImageDownloaderHelper = ImageDownloaderHelper()
  private let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
  
  // MARK: - IBOutlets
  @IBOutlet private weak var activityIndicator: UIActivityIndicatorView!
  @IBOutlet private weak var eventsTableView: UITableView!
  @IBOutlet private weak var navigationBar: UINavigationBar!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    NavigationBarHelper().setupView(for: navigationBar)
    imageDownloaderHelper.delegate = self
    requestCalendarEvents()
  }
  
  // MARK: - Private methods
  private func requestCalendarEvents() {
    if appDelegate.isThereInternetConnection {
      activityIndicator.startAnimating()
      guard let calendarURL: URL = URL(string: constants.baseUrl + constants.calendarEndpoint) else { return }
      URLSession.shared.dataTask(with: URLRequest(url: calendarURL)) { calendarData, _, error in
        self.stopActivityIndicator()
        if error == nil {
          guard let calendarData else { return }
          do {
            self.events = try JSONDecoder().decode([CalendarItem].self, from: calendarData)
            self.imageDownloaderHelper.downloadImages(for: self.events)
          } catch {
            // TODO: error al hacer petición
          }
        } else {
          // TODO: añerta
        }
      }.resume()
    } else {
      AlertHelper().showNoInternetConnectionAlert(in: self)
    }
  }
  
  private func stopActivityIndicator() {
    DispatchQueue.main.async {
      self.activityIndicator.hidesWhenStopped = true
      self.activityIndicator.stopAnimating()
    }
  }
  
  private func setupCell( _ cell: CalendarTableViewCell, _ indexPath: IndexPath) {
    if areImagesDownloaded {
      cell.eventImage.image = UIImage(data: eventsImagesData[indexPath.row])
    }
    cell.eventTitle.text = events[indexPath.row].title
    cell.eventDescription.text = events[indexPath.row].description
    cell.eventSchedule.text = events[indexPath.row].schedule
  }
}

// MARK: - TableView extension
extension CalendarViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { events.count }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let calendarCell: CalendarTableViewCell = tableView.dequeueReusableCell(withIdentifier: constants.calendarCellReusableID, for: indexPath) as! CalendarTableViewCell
    setupCell(calendarCell, indexPath)
    return calendarCell
  }
}

extension CalendarViewController: ImageDownloaderHelperDelegate {
  func didDownloadImage(imageData: [Data]) {
    eventsImagesData = imageData
    areImagesDownloaded = true
    DispatchQueue.main.async {
      self.eventsTableView.reloadData()
    }
  }
}
