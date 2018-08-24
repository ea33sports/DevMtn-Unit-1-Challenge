//
//  NotesDetailViewController.swift
//  Unit 1 Challenge
//
//  Created by Eric Andersen on 8/24/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import UIKit

class NotesDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var bodyTextField: UITextView!
    
    
    
    // MARK: - Landing Pad
    var note: Note?
    
    
    
    // MARK: - View Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = note?.title
        updateViews()
    }
    
    
    
    // MARK: - UI
    func updateViews() {
        
        guard let note = note else { return }
        titleTextField.text = note.title
        bodyTextField.text = note.bodyText
    }
    
    
    
    // MARK: - IBActions
    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        
        guard titleTextField.text != "" else { return }
        guard let title = titleTextField.text,
              let text = bodyTextField.text
              else { return }
        
        if let note = note {
            NotesController.shared.updateNote(note: note, withTitle: title, andText: text)
        } else {
            NotesController.shared.createNote(withTitle: title, andText: text)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func clearButtonTapped(_ sender: UIButton) {
        
        titleTextField.text = ""
        bodyTextField.text = ""
        
        //or
        //titleTextField.text?.removeAll()
        //bodyTextField.text.removeAll()
    }
    
}
