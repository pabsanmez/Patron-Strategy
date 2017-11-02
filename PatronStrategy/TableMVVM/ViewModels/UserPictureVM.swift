//
//  UserPictureVM.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class UserPictureVM: MainTableItemProtocol {
  
  var type: MainTableItemType{
    return .userPicture
  }

  var imgURL: String
  
  init(imgURL: String){
    self.imgURL = imgURL
  }
}

