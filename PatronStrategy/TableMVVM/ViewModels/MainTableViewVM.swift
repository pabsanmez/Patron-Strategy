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
  
  func registerCells(_ tableView: UITableView) {
    for cellType in MainTableItemType.allValues{
      let nib = UINib(nibName: cellType.idCell, bundle: nil)
      tableView.register(nib, forCellReuseIdentifier: cellType.idCell)
    }
  }
}

extension MainTableViewVM: UITableViewDataSource {
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let item = items[indexPath.row]
    let cell = item.type.cellType.cellForTableView(tableView, cellForRowAt: indexPath, idCell: item.type.idCell)
    item.type.cellType.drawCell(cell: cell, withItem: item)
    return cell
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return items.count
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


