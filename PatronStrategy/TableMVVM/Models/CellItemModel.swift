//
//  CellItemModel.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class CellItemModel: DataProtocol{
  
  var cellDrawer: PatronStrategyDrawerProtocol
  var texto: Any
  
  init(cellDrawer: PatronStrategyDrawerProtocol,texto: Any){
    self.cellDrawer = cellDrawer
    self.texto = texto
  }
}
