//
//  UserInformationModel.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class UserInformationModel {
  
  var title: String
  var value: String
  
  init(title: String, value: String){
    self.title = title
    self.value = value
  }
  init(){
    self.title = ""
    self.value = ""
  }
}
