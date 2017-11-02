//
//  MainTableViewController.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController {

  var misDatos = [MainTableItemProtocol]()
  var viewModel = MainTableViewVM()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.registerCells(self.tableView)
    self.tableView.tableFooterView = UIView()
    tableView.rowHeight = UITableViewAutomaticDimension
    tableView.estimatedRowHeight = 44
    misDatos = viewModel.items
    tableView?.dataSource = viewModel
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    /*override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return misDatos.count
    }
   
   override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let item = misDatos[indexPath.row]
      let cell = item.type.cellType.cellForTableView(tableView, cellForRowAt: indexPath, idCell: item.type.idCell)
      item.type.cellType.drawCell(cell: cell, withItem: item)
      return cell
    }*/
}
