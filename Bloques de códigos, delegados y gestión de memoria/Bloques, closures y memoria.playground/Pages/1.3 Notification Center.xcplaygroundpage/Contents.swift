//: [Previous](@previous)

import Foundation

/*
    Ventajas respecto a los otros:
        - Podemos tener múltiples elementos registrados a la vez para una sola notificación
 */
class BirdsWatcher {
    var isScannginArea = false
    
    func startScanningArea() {
        isScannginArea = true
    }
    
    func stopScanningArea() {
        isScannginArea = false
    }
    
    func birdFlyBySensor() {
        if isScannginArea == true {
            let notificationCenter = NotificationCenter.default
            notificationCenter.post(name: Notification.Name("BirdDetectedNotification"), object: nil)
        }
    }
}

class BirdsCounter {
    var birdsCount = 0
    let detector: BirdsWatcher
    
    init(detector: BirdsWatcher) {
        self.detector = detector
        
        self.detector.startScanningArea()
        let notificationsCenter = NotificationCenter.default
        notificationsCenter.addObserver(self, selector: #selector(birdDetected), name: Notification.Name("BirdDetectedNotification"), object: nil)
        
    }
    
    deinit {
        let notificationsCenter = NotificationCenter.default
        notificationsCenter.removeObserver(self)
    }
    
    @objc func birdDetected() {
        birdsCount += 1
    }
    
    func printReport() {
        print("aves detectadas: " + String(birdsCount))
    }
}

let detector = BirdsWatcher()
let counter = BirdsCounter(detector: detector)

print("------------------ Inicio contador ------------------")
counter.printReport()

print("------------------ Primeros avistamientos ------------------")
detector.birdFlyBySensor()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
counter.printReport()

class BirdsFirstAndLastTimeDetector {
    var firstTimeDetected: Date?
    var lastTimeDetected: Date?
    let detector: BirdsWatcher
    
    init(detector: BirdsWatcher) {
        self.detector = detector
        self.detector.startScanningArea()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(birdDetected), name: Notification.Name("BirdDetectedNotification"), object: nil)
    }
    
    deinit {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    // función de detección de aves
    @objc func birdDetected() {
        let now = Date()
        if firstTimeDetected == nil {
            firstTimeDetected = now
        }
        lastTimeDetected = now
    }
    
    func printReport() {
        if let firstTimeDetected = self.firstTimeDetected, let lastTimeDetected = self.lastTimeDetected {
            let timmeInterval = lastTimeDetected.timeIntervalSince(firstTimeDetected)
            print("Segundos entre el primer y el último ave detectadas: " + String(timmeInterval))
        } else {
            print("No se han detectado aves")
        }
    }
}

let timesDetector = BirdsFirstAndLastTimeDetector(detector: detector)
timesDetector.printReport()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
detector.birdFlyBySensor()
counter.printReport()
timesDetector.printReport()
//: [Next](@next)
