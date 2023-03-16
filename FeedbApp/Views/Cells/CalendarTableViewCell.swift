//
//  CalendarTableViewCell.swift
//  FeedbApp
//
//  Created by Reivaj Gomez on 15/03/23.
//

import UIKit

class CalendarTableViewCell: UITableViewCell {

  // MARK: - IBOutlets
  @IBOutlet weak var eventImage: UIImageView!
  @IBOutlet weak var eventTitle: UILabel!
  @IBOutlet weak var eventDescription: UILabel!
  @IBOutlet weak var eventSchedule: UILabel!
  
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  override func setSelected(_ selected: Bool, animated: Bool) {
    super.setSelected(selected, animated: animated)
    
    // Configure the view for the selected state
  }

}
