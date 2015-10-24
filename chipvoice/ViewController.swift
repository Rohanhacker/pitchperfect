//
//  ViewController.swift
//  chipvoice
//
//  Created by Rohan Malhotra on 5/7/15.
//  Copyright (c) 2015 Rohan Malhotra. All rights reserved.
//

import UIKit
import AVFoundation
var audioRecorder:AVAudioRecorder!
var recordedAudio:RecordedAudio!



class ViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var sto: UIButton!
    @IBOutlet weak var rec: UIButton!
    override func viewWillAppear(animated: Bool) {
        sto.hidden = true
    }
    
    @IBAction func stopp(sender: AnyObject) {
        audioRecorder.stop()
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: nil)
    }
    @IBAction func reca(sender: AnyObject) {
        rec.enabled = false
        sto.hidden = false
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        println(filePath)
        
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: nil)
        audioRecorder = AVAudioRecorder(URL: filePath, settings: nil, error: nil)
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
       
    }
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if(flag) {
        recordedAudio = RecordedAudio()
        recordedAudio.filePathUrl = recorder.url
        recordedAudio.title = recorder.url.lastPathComponent
        self.performSegueWithIdentifier("stopRecording", sender: recordedAudio)
        } else {
            println("something went wrong")
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let PlaySoundsVC:SoundConViewController = segue.destinationViewController as SoundConViewController
        let data = sender as RecordedAudio
        PlaySoundsVC.receivedAudio = data 
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

