//
//  ImageDownloaderHelper.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import Foundation

protocol ImageDownloaderHelperDelegate {
  func didDownloadImage(imageData: [Data])
}

final class ImageDownloaderHelper {
  
  var delegate: ImageDownloaderHelperDelegate?
  
  func downloadImages(for events: [CalendarItem]) {
    var imagesData: [Data] = [Data](repeating: Data(), count: events.count)
    for index in .zero..<events.count {
      DispatchQueue.global().async {
        if let imageURL: URL = URL(string: events[index].image),
        let imageData = try? Data(contentsOf: imageURL) {
          imagesData[index] = imageData
          self.delegate?.didDownloadImage(imageData: imagesData)
        }
      }
    }
  }
}
