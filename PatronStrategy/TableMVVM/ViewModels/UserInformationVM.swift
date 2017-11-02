//
//  UserInformationVM.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class UserInformationVM: MainTableItemProtocol {
  
  var type: PatronStrategyDrawerProtocol{
    return ATableViewCell()
  }
    
  var title: String
  var value: String
  
  init(title: String, value: String){
    self.title = title
    self.value = value
  }
  
}



