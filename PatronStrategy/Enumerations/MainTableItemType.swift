//
//  MainTableItemType.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

enum MainTableItemType {
  
  case userInformation
  case userPicture
  
  static let allValues = [userInformation, userPicture]
  
  var idCell: String {
    switch self {
    case.userInformation:
      return String("ATableViewCell")
    case.userPicture:
      return String("BTableViewCell")
    }
  }
  
  var cellType: cellDrawerProtocol{
    switch self {
    case.userInformation:
      return ATableViewCell()
    case.userPicture:
      return BTableViewCell()
    }
  }
}
