//
//  MainTableViewVM.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation
import UIKit

class MainTableViewVM: NSObject {
  
  var items = [MainTableItemProtocol]()
  
  override init() {
    super.init()
    guard let data = dataFromFile("dataExample"), let profile = MainTableModel(data: data) else { return }
    
    if let name = profile.nombre{
      let nameVM = UserInformationVM(title: "Nombre", value: name)
      items.append(nameVM)
    }
    if let apellidos = profile.apellidos{
      let apellidosVM = UserInformationVM(title: "Apellidos", value: apellidos)
      items.append(apellidosVM)
    }
      
      
      
    /*  let apellidos = profile.apellidos {
      let nameA = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
      items.append(nameAndPictureItem)
    }*/
    /*if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
      let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
      items.append(nameAndPictureItem)
    }*/
    
    // initialization code will go here
  }
}

public func dataFromFile(_ filename: String) -> Data? {
  @objc class TestClass: NSObject { }
  let bundle = Bundle(for: TestClass.self)
  if let path = bundle.path(forResource: filename, ofType: "json") {
    return (try? Data(contentsOf: URL(fileURLWithPath: path)))
  }
  return nil
}

enum MainTableItemType {
  case userInformation
  case userPicture
  case userDate
}
