//
//  StoreTableViewController.swift
//  ParseStarterProject-Swift
//
//  Created by Mason Killgore on 3/27/17.
//  Copyright © 2017 Parse. All rights reserved.
//

import UIKit

class StoreTableViewController: UITableViewController {

    
    //The data model for the table view controller 
    
    var stores = [["name":"Best Friend","image":"1","item":"Camera"],["name":"Mom","image":"2","item":"Flowers"],["name":"Dad","image":"3","item":"Some kind of tech"],["name":"Sister","image":"4","item":"Sweets"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let iconImageView = UIImageView(image: UIImage(named: "Shape"))
        self.navigationItem.titleView = iconImageView
        
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
        return stores.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Making the cell for the table view controller 
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! StoreTableViewCell
        
        let storeObject = stores[indexPath.row]
        cell.backgroundImageView.image = UIImage(named: storeObject["image"]!)
        cell.nameLabel.text = storeObject["name"]
        cell.itemLabel.text = storeObject["item"]
        
        return cell
    
    }
 
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
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
