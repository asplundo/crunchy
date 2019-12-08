//
// Created by me
  

import Foundation
import AVFoundation

class TimerSettings: ObservableObject {
    
    enum State {
        case idle
        case getReady
        case running
        case finished
    }
    
    @Published var state: State = .idle
    @Published var sets: Int = 6
    @Published var duration: Int = 30 {
        didSet {
            countDown = duration
        }
    }
    @Published var complete = false
    @Published var countDown = 0
    @Published var getReadyTime = 3.0
    var count = 0
    var timer: Timer?
        
    init() {
        self.countDown = duration
    }
    
    func getReady() {
        setTimer(with: getReadyTime, selector: #selector(start), repeats: false)
        state = .getReady
        
    }
    
    @objc func start() {
        state = .running
        complete = false
        startTimer()
    }
    
    func reset() {
        timer?.invalidate()
        timer = nil
        count = 0
        countDown = duration
        state = .idle
    }
        
    private func startTimer() {
        setTimer(with: 1.0, selector: #selector(updateDuration), repeats: true)
        countDown = duration
        AudioPlayer.shared.playWhistleSound()
    }
    
    private func setTimer(with interval: TimeInterval, selector: Selector, repeats: Bool) {
        if self.timer != nil {
            self.timer?.invalidate()
            self.timer = nil
        }
        let timer = Timer(timeInterval: interval, target: self, selector: selector, userInfo: nil, repeats: repeats)
        RunLoop.current.add(timer, forMode: .common)
        timer.tolerance = 0.1
        self.timer = timer
    }

    
    @objc func updateDuration() {
        countDown -= 1
        if countDown <= 0 {
            count += 1
            if count < sets {
                AudioPlayer.shared.playHornSound()
                getReady()
            } else {
                timer?.invalidate()
                timer = nil
                state = .finished
                AudioPlayer.shared.playFinishedSound()
            }
        }
    }
}
