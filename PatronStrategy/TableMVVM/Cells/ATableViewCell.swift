//
//  ATableViewCell.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

struct aModel {
  var text: String
  init (text: String){
    self.text = text
  }
}

class ATableViewCell: UITableViewCell, PatronStrategyDrawerProtocol {
  
  @IBOutlet weak var label: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  
  //Protocol Methods
  func drawCell(cell: UITableViewCell, withItem item: Any) {
    if let cell = cell as? ATableViewCell, let item = item as? aModel {
      cell.label.text = item.text
    }
  }
  
  
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "ATableViewCell", for: indexPath)
  }
    
}
