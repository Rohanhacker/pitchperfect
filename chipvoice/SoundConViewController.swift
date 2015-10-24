//
//  SoundConViewController.swift
//  chipvoice
//
//  Created by Rohan Malhotra on 5/7/15.
//  Copyright (c) 2015 Rohan Malhotra. All rights reserved.
//

import UIKit
import AVFoundation

class SoundConViewController: UIViewController {
    var audioplayer:AVAudioPlayer!
    var receivedAudio:RecordedAudio!
    override func viewDidLoad() {
        //var fileurl = NSBundle.mainBundle().URLForResource("movie_quote", withExtension: "mp3")
       audioplayer = AVAudioPlayer(contentsOfURL: receivedAudio.filePathUrl, error: nil)
        // Do any additional setup after loading the view.
        audioplayer.enableRate = true
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBAction func fasts(sender: AnyObject) {
        audioplayer.enableRate = true
        audioplayer.rate = 1.5
        audioplayer.play()
    }
    @IBAction func psound(sender: AnyObject) {
        audioplayer.enableRate = true
        audioplayer.rate = 0.5
        audioplayer.play()
        
    }

    @IBAction func stopb(sender: AnyObject) {
        audioplayer.stop()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
