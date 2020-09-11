//
//  ChoiceTableViewController.swift
//  Indecisive
//
//  Created by Suzanne Nie on 9/11/20.
//  Copyright © 2020 Suzanne Nie. All rights reserved.
//

import UIKit

class ChoiceTableViewController: UITableViewController {
    
    //MARK: Properties
    var choices = [Choice]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load the sample data.
        loadSampleChoices()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return choices.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ChoiceTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ChoiceTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ChoiceTableViewCell.")
        }
        
        // Fetches the appropriate meal for the data source layout.
        let choice = choices[indexPath.row]
        
        cell.nameLabel.text = choice.name
        
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
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
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    //MARK: Actions
    
    @IBAction func unwindToChoiceList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ChoiceViewController, let choice = sourceViewController.choice {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: choices.count, section: 0)
            
            choices.append(choice)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }
    
    
    //MARK: Private Methods
     
    private func loadSampleChoices() {
    
        guard let choice1 = Choice(name: "choice1") else {
            fatalError("Unable to instantiate choice1")
        }
        guard let choice2 = Choice(name: "choice2") else {
            fatalError("Unable to instantiate choice2")
        }
        guard let choice3 = Choice(name: "choice3") else {
            fatalError("Unable to instantiate choice3")
        }
        
        choices += [choice1, choice2, choice3]
    }

}
