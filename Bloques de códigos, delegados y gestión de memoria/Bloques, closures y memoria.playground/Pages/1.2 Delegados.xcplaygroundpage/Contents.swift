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

class BirdsCounter: BirdsWatcherDelegate {
    var birdsCount = 0
    let detector: BirdWatcher
    
    init(detector: BirdWatcher) {
        self.detector = detector
        
        self.detector.startScanningArea()
        self.detector.delegate = self
    }
    
    func printReport() {
        print("Aves detectadas: " + String(birdsCount))
    }
    func birdDetected() {
        birdsCount += 1
    }
}

let detector = BirdWatcher()
let counter = BirdsCounter(detector: detector)

print("------------------ Inicio contador ------------------")
counter.printReport()

print("------------------ Primeros avistamientos ------------------")
detector.birdFlyBySensor()
detector.birdFlyBySensor()
counter.printReport()

print("------------------ Parando el sensor ------------------")
detector.stopScanningArea()
detector.birdFlyBySensor()
counter.printReport()
//: [Next](@next)
