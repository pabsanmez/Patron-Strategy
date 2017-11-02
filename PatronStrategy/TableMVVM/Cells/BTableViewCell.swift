//
//  BTableViewCell.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

struct bModel {
  var text: String
  init (text: String){
    self.text = text
  }
}
class BTableViewCell: UITableViewCell, PatronStrategyDrawerProtocol {
  
 
  @IBOutlet weak var lblB: UILabel!
  @IBOutlet weak var lblC: UILabel!
  
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
    if let cell = cell as? BTableViewCell, let item = item as? UserInformationVM {
      cell.lblB.text = item.title
      cell.lblC.text = "Meeeeeh"
    }
  }
  
  
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: "BTableViewCell", for: indexPath)
  }
  
  func registerCell(_ tableView: UITableView){
    let nib = UINib(nibName: "BTableViewCell", bundle: nil)
    tableView.register(nib, forCellReuseIdentifier: "BTableViewCell")
  }
  
    
}
