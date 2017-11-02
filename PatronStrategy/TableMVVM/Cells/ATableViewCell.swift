//
//  ATableViewCell.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

class ATableViewCell: UITableViewCell, cellDrawerProtocol {
  
  @IBOutlet weak var lblTitle: UILabel!
  @IBOutlet weak var lblValue: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
  
  //Protocol Methods
  func drawCell(cell: UITableViewCell, withItem item: MainTableItemProtocol) {
    if let cell = cell as? ATableViewCell, let item = item as? UserInformationVM {
      cell.lblTitle.text = item.title
      cell.lblValue.text = item.value
    }
  }

  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell  {
    return tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
  }
}
