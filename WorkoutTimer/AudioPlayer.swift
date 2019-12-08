//
// Created by me
  

import Foundation
import AVFoundation

class AudioPlayer {
    
    private let mp3Extension = "mp3"
    private let wavExtension = "wav"
    private var player: AVAudioPlayer?
    
    static let shared = AudioPlayer()
    
    private init () {  }
    
    func playWhistleSound() {
        playSound(with: "whistle", fileExtension: mp3Extension)
    }
    
    func playHornSound() {
        playSound(with: "airhorn", fileExtension: mp3Extension)
    }
    
    func playFinishedSound() {
        playSound(with: "finished", fileExtension: wavExtension)
    }
    
    private func playSound(with name: String, fileExtension: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: fileExtension) else {
            fatalError("No file with name \(name).\(fileExtension)")
        }
        do {
            let player = try AVAudioPlayer(contentsOf: url, fileTypeHint: fileExtension)
            self.player = player
            self.player?.prepareToPlay()
            self.player?.play()
        } catch {
            print(error.localizedDescription)
        }
        
        
    }
    
}
