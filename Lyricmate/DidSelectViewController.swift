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
    var audioPlayer: AVAudioPlayer!
    var song: Song!
    var coreDataManager: CoreDataManager!
    let uuid = UUID().uuidString
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CoreData
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        coreDataManager = CoreDataManager(managedContext: managedContext)
        
        textView?.text = song.lyrics
        
        
        //

    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @IBAction func playBackAudio() {
        print("Button Call")
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent(uuid)

//        do {
//            playBack = try AVAudioPlayer(contentsOf: audioFilename)
//            playBack?.play()
//            print("Success")
//        } catch {
//            print("There was an error: \(error)")
//    }
    
            print("I Played")
        

//        do {
//            playBack = try AVAudioPlayer(contentsOf: audioFilename)
//            playBack?.play()
//            transcribeAudio(url: audioFilename)
//            print("Success")
//        } catch {
//            print("There was an error: \(error)")
    }
}

