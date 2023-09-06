//: [Previous](@previous)

import Foundation

class BirdWatcher {
    var isScanningArea = false
    var birdDetectedNotigicationAction: () -> Void = {}  // closure
    
    func startScanningArea() {
        isScanningArea = true
    }
    
    func stopScanningArea() {
        isScanningArea = false
    }
    
    func setNotificationAction(_ notificationAction: @escaping () -> Void) {
        // notificationAction el @escaping significa que el bloque de código no lo vamos a ejecutar ahora sino más adelante en el código
        birdDetectedNotigicationAction = notificationAction
    }
    
    func birdFlyByNearSensor() {
        if isScanningArea == true {
            birdDetectedNotigicationAction()
        }
    }
}

class BirdsCounter {
    var birdsCount = 0
    let birdsDetector: BirdWatcher
    
    init(birdsDetector: BirdWatcher) {
        self.birdsDetector = birdsDetector
        
        self.birdsDetector.startScanningArea() // Activamos el scaneo
        self.birdsDetector.setNotificationAction {
            self.birdsCount += 1
        }
    }
    
    func printReport() {
        print("Aves detectadas: \(birdsCount)")
    }
}

//: [Next](@next)
