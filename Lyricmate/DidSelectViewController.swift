//
//  DidSelectViewController.swift
//  Lyricmate
//
//  Created by Dustin McGuire on 5/4/21.
//

import UIKit
import AVFoundation


class DidSelectViewController : UIViewController {
    

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var playButton: UIButton!
    var songList: [Song] = []
    var coreDataManager: CoreDataManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // CoreData
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        coreDataManager = CoreDataManager(managedContext: managedContext)
        //
        songList = coreDataManager.returnSongs()
        
    }
    
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    func textAudio() {
        lyrics = textView.text
        
    }
    
}

