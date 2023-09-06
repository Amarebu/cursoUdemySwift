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


//: [Next](@next)
