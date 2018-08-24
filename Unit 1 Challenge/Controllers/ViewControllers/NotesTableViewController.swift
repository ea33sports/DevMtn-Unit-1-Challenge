//
//  NotesTableViewController.swift
//  Unit 1 Challenge
//
//  Created by Eric Andersen on 8/24/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class NotesTableViewController: UITableViewController {

    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
    
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return NotesController.shared.notes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "notesCell", for: indexPath)
        let note = NotesController.shared.notes[indexPath.row]

        // Configure the cell...
        cell.textLabel?.text = note.title

        return cell
    }
 
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete {
            
            let note = NotesController.shared.notes[indexPath.row]
            NotesController.shared.deleteNote(note: note)
            
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        
    }
 
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    
    
 
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "cellToNotesDetailVC" {
            let destinationVC = segue.destination as? NotesDetailViewController
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let note = NotesController.shared.notes[indexPath.row]
            destinationVC?.note = note
        }
    }
}






























































