//
//  CoreDataManager.swift
//  Lyricmate
//
//  Created by Dustin McGuire on 5/1/21.
//

import Foundation
import CoreData


class CoreDataManager {
    var managedContext: NSManagedObjectContext!
    
    func saveSong(lyric: String) {
        //let song = Song(context: managedContext)
        let entity = NSEntityDescription.entity(forEntityName: "Song", in: managedContext)!
        let song = NSManagedObject(entity: entity, insertInto: managedContext) as? Song
        song?.lyrics = lyric
        //song!.setValue(lyric, forKey: "lyrics")
        save()
    }
    func save() {
        if managedContext.hasChanges {
            do {
                try managedContext.save()
                print("saved succesfully")
            } catch let error {
                print("Could not save \(error)")
            }
        }
    }
    func returnSongs() -> [Song] {
        let fetchRequest = Song.createFetchRequest()
        do {
            return try self.managedContext.fetch(fetchRequest)
        } catch let error {
            print("Somthing went wrong \(error)")
            return []
        }
    }
    
    init(managedContext: NSManagedObjectContext) {
        self.managedContext = managedContext
    }
    
}
