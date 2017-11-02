//
//  BTableViewCell.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

class BTableViewCell: UITableViewCell, cellDrawerProtocol {
  
 
  @IBOutlet weak var profilePicture: UIImageView!
  
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
    if let cell = cell as? BTableViewCell, let item = item as? UserPictureVM {
      //cell.profilePicture.sd_setImage(with: URL(string: "https://bisite.usal.es/archivos/pablo.df_.jpg"))
      cell.profilePicture.layer.cornerRadius = cell.profilePicture.frame.size.width / 2;
      cell.profilePicture.clipsToBounds = true;
      cell.profilePicture.image = UIImage(named: item.imgURL)
    }
  }
  
  
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell {
    return tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
  }
}
