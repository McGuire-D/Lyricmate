//
//  Song+CoreDataProperties.swift
//  Lyricmate
//
//  Created by Dustin McGuire on 5/1/21.
//
//

import Foundation
import CoreData


extension Song {

    @nonobjc public class func createFetchRequest() -> NSFetchRequest<Song> {
        return NSFetchRequest<Song>(entityName: "Song")
    }

    @NSManaged public var lyrics: String?
    @NSManaged public var vocals: Data?

}

extension Song : Identifiable {

}
