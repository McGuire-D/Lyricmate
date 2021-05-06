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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CoreData
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        coreDataManager = CoreDataManager(managedContext: managedContext)
        
        
        //

    }
    
    
    @IBAction func playBackAudio() {
        
        if let audioData = song.vocals{
            let playBack  = try? AVAudioPlayer.init(data: audioData)
            playBack?.play()
        }

//        do {
//            playBack = try AVAudioPlayer(contentsOf: audioFilename)
//            playBack?.play()
//            transcribeAudio(url: audioFilename)
//            print("Success")
//        } catch {
//            print("There was an error: \(error)")
    }
}

