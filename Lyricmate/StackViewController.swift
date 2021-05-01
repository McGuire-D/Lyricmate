//
//  StackViewController.swift
//  Lyricmate
//
//  Created by Dustin McGuire on 4/28/21.
//

import Foundation
import CoreData

struct StackViewController {
    class NSpersistentContainer: NSObject {
    
        func saveContext() {
        let NSpersistentContainer = persistentContainer.viewContext
             if context.hasChanges {
               do {
                 try context.save()
              } catch {
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
              }
            }
          }
    }
}
