//
//  PatronStrategyDrawerProtocol.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation
import UIKit

protocol cellDrawerProtocol {
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell
  func drawCell(cell: UITableViewCell , withItem item: MainTableItemProtocol)
}

extension cellDrawerProtocol {
    func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath, idCell: String) -> UITableViewCell  {
        return tableView.dequeueReusableCell(withIdentifier: idCell, for: indexPath)
    }
}

protocol MainTableItemProtocol{
  var type: MainTableItemType { get }
}
