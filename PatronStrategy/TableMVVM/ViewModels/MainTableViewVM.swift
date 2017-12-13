//
//  MainTableViewVM.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 2/11/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import Foundation

class MainTableViewVM: NSObject {
  
  private var items = [MainTableItemProtocol]()
  
  var getItems: [MainTableItemProtocol] {
    return items
  }
  
  override init() {
    super.init()
    guard let data = dataFromFile("dataExample"), let profile = MainTableModel(data: data) else { return }
    
    if let imgURL = profile.profilePicture {
      let imgURLVM = UserPictureVM(imgURL: imgURL)
      items.append(imgURLVM)
    }
    
    if let name = profile.nombre {
      let nameVM = UserInformationVM(title: "Nombre", value: name)
      items.append(nameVM)
    }
    if let apellidos = profile.apellidos {
      let apellidosVM = UserInformationVM(title: "Apellidos", value: apellidos)
      items.append(apellidosVM)
    }
  }
}

//Public Func to read data from .json File
public func dataFromFile(_ filename: String) -> Data? {
  @objc class TestClass: NSObject { }
  let bundle = Bundle(for: TestClass.self)
  if let path = bundle.path(forResource: filename, ofType: "json") {
    return (try? Data(contentsOf: URL(fileURLWithPath: path)))
  }
  return nil
}


