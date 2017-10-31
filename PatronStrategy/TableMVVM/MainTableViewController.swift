//
//  MainTableViewController.swift
//  PatronStrategy
//
//  Created by Pablo Sanchez Gomez on 31/10/17.
//  Copyright © 2017 Pablo Sanchez Gomez. All rights reserved.
//

import UIKit

struct Objeto: DataProtocol{
  var cellDrawer: PatronStrategyDrawerProtocol
  var texto: Any
  
  init(cellDrawer: PatronStrategyDrawerProtocol,texto: Any){
    self.cellDrawer = cellDrawer
    self.texto = texto
  }
}

class MainTableViewController: UITableViewController {

  var misDatos = [DataProtocol]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    let aNib = UINib(nibName: "ATableViewCell", bundle: nil)
    self.tableView.register(aNib, forCellReuseIdentifier: "ATableViewCell")
    let bNib = UINib(nibName: "BTableViewCell", bundle: nil)
    self.tableView.register(bNib, forCellReuseIdentifier: "BTableViewCell")
    self.tableView.tableFooterView = UIView()
    
    var añadir = Objeto(cellDrawer: ATableViewCell(), texto: aModel(text: "primero"))
    misDatos.append(añadir)
    añadir = Objeto(cellDrawer: BTableViewCell(), texto: bModel(text: "segundo"))
    misDatos.append(añadir)
    añadir = Objeto(cellDrawer: BTableViewCell(), texto: bModel(text: "tercero"))
    misDatos.append(añadir)
    añadir = Objeto(cellDrawer: ATableViewCell(), texto: aModel(text: "cuarto"))
    misDatos.append(añadir)
    
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
      
      
      let cell = item.cellDrawer.cellForTableView(tableView, cellForRowAt: indexPath)
      item.cellDrawer.drawCell(cell: cell, withItem: item.texto)
      return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
}
