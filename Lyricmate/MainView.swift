//
//  ViewController.swift
//  Lyricmate
//
//  Created by Dustin McGuire on 4/5/21.
//

import UIKit
import AVFoundation
import Speech
import CoreData

protocol RecordSelectDelegate {
    func finishRecording(type: Bool)
}


class mainView: UIViewController, AVAudioPlayerDelegate {


    @IBOutlet weak var playButton: UIButton!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var transcribeText: UITextView!
    
    
    //var recordButton: UIButton!
//    var recordingSession: AVAudioSession!
//    var audioRecorder: AVAudioRecorder!
//    var playBack: AVAudioPlayer?
    var recordDelegate: RecordSelectDelegate!
    var audioManager: AudioManager!
    var coreDataManager: CoreDataManager!
    let uuid = UUID().uuidString
    //var lyrics: NSManagedObject = [Lyrics]
    //var sound: NSManagedObject = [Lyrics]

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        recordingSession = AVAudioSession.sharedInstance()
//        requestTranscribePermissions()
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedContext = appDelegate!.persistentContainer.viewContext
        coreDataManager = CoreDataManager(managedContext: managedContext)
        audioManager = AudioManager()
        //audioRecorder.delegate = self
        
//        do {
//            try recordingSession.setCategory(.playAndRecord, mode: .default)
//            try recordingSession.setActive(true)
//            recordingSession.requestRecordPermission() { [unowned self] allowed in
//                DispatchQueue.main.async {
//                    if allowed {
//                        self.loadRecordingUI()
//                    } else {
//                        // failed to record!
//                    }
//                }
//            }
//        } catch {
//            // place error on screen alert here
//        }
        // Do any additional setup after loading the view.
    }
    func loadRecordingUI() {
        recordButton.setTitle("Tap to Record", for: .normal)
        recordButton.titleLabel?.font = UIFont.preferredFont(forTextStyle: .title1)
        recordButton.addTarget(self, action: #selector(recordTapped), for: .touchUpInside)
        view.addSubview(recordButton)
    }
    func startRecording() {
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent(uuid)
        audioManager.startRecording(url: audioFilename)
        
      
//
//        let settings = [
//            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
//            AVSampleRateKey: 12000,
//            AVNumberOfChannelsKey: 1,
//            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
//        ]
//
//        do {
//          audioRecorder = try AVAudioRecorder(url: audioFilename, settings: settings)
//          audioRecorder.delegate = self
//          audioRecorder.record()
//
//            recordButton.setTitle("Tap to Stop", for: .normal)
//        } catch {
//            finishRecording(success: false)
//
//        }
    }
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func finishRecording(success: Bool) {
//        audioRecorder.stop()
//        audioRecorder = nil

//        if success {
//            recordButton.setTitle("Tap to Re-record", for: .normal)
//        } else {
//            recordButton.setTitle("Tap to Record", for: .normal)
//            // recording failed :(
//        }
    }
    
    @IBAction func recordTapped() {
        
        let audioFilename = getDocumentsDirectory().appendingPathComponent(uuid)
        audioManager.startRecording(url: audioFilename)
        

//        if audioRecorder == nil {

//            startRecording()
//        } else {
//            finishRecording(success: true)
//        }
//    }
//    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
//        if !flag {
//            finishRecording(success: false)
//        }
    }
    
    @IBAction func playBackAudio() {
         
//        let audioFilename = getDocumentsDirectory().appendingPathComponent(uuid)
//
//        do {
//            playBack = try AVAudioPlayer(contentsOf: audioFilename)
//            playBack?.play()
//            transcribeAudio(url: audioFilename)
//            print("Success")
//        } catch {
//            print("There was an error: \(error)")
//    }
    
}
    
//    func requestTranscribePermissions() {
//        SFSpeechRecognizer.requestAuthorization { [unowned self] authStatus in
//            DispatchQueue.main.async {
//                if authStatus == .authorized {
//                    print("Good to go!")
//                } else {
//                    print("Transcription permission was declined.")
//                }
//            }
//        }
//    }
    
    func transcribeAudio(url: URL) {
        // create a new recognizer and point it at our audio
        let audioFilename = getDocumentsDirectory().appendingPathComponent("recording.m4a")

        let recognizer = SFSpeechRecognizer()
        let request = SFSpeechURLRecognitionRequest(url: audioFilename)

        // start recognition!
        recognizer?.recognitionTask(with: request) { [unowned self] (result, error) in
            // abort if we didn't get any transcription back
            guard let result = result else {
                print("There was an error: \(error!)")
                return
            }

            // if we got the final transcription back, print it
            if result.isFinal {
                transcribeText.text = result.bestTranscription.formattedString
                coreDataManager.saveSong(lyric: transcribeText.text, uuid: uuid)
                
//                do {
//                   //let data = try Data(contentsOf: audioFilename)
//                    coreDataManager.saveSong(lyric: transcribeText.text ,uuid: uuid)
//                    print(result.bestTranscription.formattedString)
//                } catch {
//                    print("There was an error: \(error)")
//
//                }
                // pull out the best transcription...
            }
        }
    }
    
    
}

// MARK: AVAudioDelegateFunctions

//extension ViewController : {
//
//}
