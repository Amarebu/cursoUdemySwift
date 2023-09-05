//: [Previous](@previous)

import Foundation

protocol BirdsWatcherDelegate {
    func birdDetected()
}

class BirdWatcher {
    var isScannginArea = false
    var delegate: BirdsWatcherDelegate? = nil
    
    func startScanningArea() {
        isScannginArea = true
    }
    
    func stopScanningArea() {
        isScannginArea = false
    }
    
    func birdFlyBySensor() {
        if isScannginArea == true {
            if let delegate = self.delegate {
                delegate.birdDetected()
            }
        }
    }
}


//: [Next](@next)
