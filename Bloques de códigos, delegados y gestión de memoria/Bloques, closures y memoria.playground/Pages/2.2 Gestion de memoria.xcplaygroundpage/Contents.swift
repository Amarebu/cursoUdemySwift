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

/*
 BirdsWatcher tiene una referencia a BirdsCounter porque su delegdo es el que lo retiene
 Además BirdCounter tiene una referencia al BirdWatcher 
 */
class BirdsCounter {
    var birdsCount = 0
    let birdsDetector: BirdWatcher
    
    init(birdsDetector: BirdWatcher) {
        self.birdsDetector = birdsDetector
        
        self.birdsDetector.startScanningArea() // Activamos el scaneo
        self.birdsDetector.setNotificationAction {
            self.birdsCount += 1        // Aquí aumenta la referencia a 1
        }
    }
    
    func printReport() {
        print("Aves detectadas: \(birdsCount)")
    }
}

var detector = BirdWatcher()
var counter = BirdsCounter(birdsDetector: detector) // Línea de referencia 2
//: [Next](@next)
