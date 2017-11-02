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
    let aCell = ATableViewCell()
    aCell.registerCell(self.tableView)
    
    let bNib = UINib(nibName: "BTableViewCell", bundle: nil)
    self.tableView.register(bNib, forCellReuseIdentifier: "BTableViewCell")
    self.tableView.tableFooterView = UIView()

    misDatos = viewModel.items
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return misDatos.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let item = misDatos[indexPath.row]
      
      let cell = item.type.cellForTableView(tableView, cellForRowAt: indexPath)
      item.type.drawCell(cell: cell, withItem: item)
      
      //let cell = item.cellDrawer.cellForTableView(tableView, cellForRowAt: indexPath)
      //item.cellDrawer.drawCell(cell: cell, withItem: item.texto)
      
      return cell
    }
}
