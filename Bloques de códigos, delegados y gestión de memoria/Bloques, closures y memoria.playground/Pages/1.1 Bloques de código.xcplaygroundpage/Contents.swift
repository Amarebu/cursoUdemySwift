import UIKit

// Los bloques de código como notificadores de eventos
// Notificar eventos asíncronos, con closures

/*
    Ejercicio: Sensor de aves
        Contabilizar los pájaros en el momento que pasen
*/

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

let detector = BirdWatcher()
let counter = BirdsCounter(birdsDetector: detector)

print("---------------- Probando el contador ----------------")
counter.printReport()

print("---------------- Primera ronda de deteciones ----------------")
detector.birdFlyByNearSensor()
detector.birdFlyByNearSensor()
detector.birdFlyByNearSensor()
counter.printReport()

print("---------------- Paramos el sensor ----------------")

detector.stopScanningArea()

detector.birdFlyByNearSensor()
detector.birdFlyByNearSensor()

counter.printReport()
