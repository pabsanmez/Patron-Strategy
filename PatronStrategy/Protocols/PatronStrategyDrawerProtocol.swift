//
//  PatronStrategyDrawerProtocol.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation
import UIKit

protocol PatronStrategyDrawerProtocol {
  func cellForTableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
  func drawCell(cell: UITableViewCell , withItem item: MainTableItemProtocol)
  //var item: MainTableItemProtocol? { get set }
}

protocol DataProtocol {
  var cellDrawer: PatronStrategyDrawerProtocol { get }
  var texto: Any { get }
}

protocol MainTableItemProtocol{
  var type: PatronStrategyDrawerProtocol { get }
}
