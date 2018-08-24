//
//  NotesController.swift
//  Unit 1 Challenge
//
//  Created by Eric Andersen on 8/24/18.
//  Copyright © 2018 Eric Andersen. All rights reserved.
//

import Foundation

class NotesController {
    
    // MARK: - Initialize Singleton
    static var shared = NotesController()
    
    
    
    // MARK: - Source of Truth
    var notes: [Note] = []
    
    
    
    // MARK: - CRUD
    //Create
    func createNote(withTitle title: String, andText text: String) {
        
        let note = Note(title: title, bodyText: text)
        notes.append(note)
        saveToPersistentStorage()
    }
    
    //Update
    func updateNote(note: Note, withTitle newTitle: String, andText newText: String) {
        
        note.title = newTitle
        note.bodyText = newText
        saveToPersistentStorage()
    }
    
    //Delete
    func deleteNote(note: Note) {
        
        guard let index = notes.index(of: note) else { return }
        notes.remove(at: index)
        saveToPersistentStorage()
    }
    
    
    
    // MARK: - Persistence
    func fileURL() -> URL {
        
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = path[0]
        let fileName = "notes.json"
        let fullURL = documentsDirectory.appendingPathComponent(fileName)
        
        return fullURL
    }
    
    func saveToPersistentStorage() {
        
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(notes)
            try data.write(to: fileURL())
        } catch {
            print("💩 There was an error Saving to the Persistent Store \(error): \(error.localizedDescription) 💩")
        }
    }
    
    func loadFromPersistentStorage() -> [Note] {
        
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: fileURL())
            let notes = try decoder.decode([Note].self, from: data)
            return notes
        } catch {
            print("💩 There was an error Loading from the Persistent Store \(error): \(error.localizedDescription) 💩")
        }
        return []
    }
}
