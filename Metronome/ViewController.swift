//
//  ViewController.swift
//  Metronome
//
//  Created by gpalya on 8/15/19.
//  Copyright © 2019 gpalya. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var timer: Timer!
    var count = 0
    var audioPlayer1: AVAudioPlayer!
    var audioPlayer2: AVAudioPlayer!
    
    //MARK: Properties
    @IBOutlet weak var switchOutlet: UISwitch!
    
    
    //MARK: Actions
    @IBAction func switchFlipped(_ sender: Any) {
        if timer != nil {
            timer.invalidate()
        }
        if switchOutlet.isOn {
            timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(self.playSound), userInfo: nil, repeats: true)
        }
    }
    
    @objc func playSound() {
        if count % 5 == 0 {
            audioPlayer2.play()
        } else {
            audioPlayer1.play()
        }
        count += 1
    }
    
    func cancelTimer() {
        if timer != nil {
            timer.invalidate()
        }
        switchOutlet.setOn(false, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //let sound1 = Bundle.main.path(forResource: "MetronomeBar", ofType: "wav")
        //let sound2 = Bundle.main.path(forResource: "MetronomClaves", ofType: "wav")
        
        let sound1 = Bundle.main.path(forResource: "MetroBeat1", ofType: "wav")
        let sound2 = Bundle.main.path(forResource: "MetroBar1", ofType: "wav")
        do {
            audioPlayer1 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound1!))
            audioPlayer2 = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound2!))
        } catch {
            NSLog("Metronome: sound related error")
        }
    }

    // girish
    // make the font of top status bar white
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}

