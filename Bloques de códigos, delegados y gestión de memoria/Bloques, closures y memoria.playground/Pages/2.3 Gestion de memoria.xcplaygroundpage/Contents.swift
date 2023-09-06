//: [Previous](@previous)

import Foundation

/*
 Vamos a ver como evitar esos ciclos de referencias
 */

class TestClass {
    
}

func checkIfReferenceIsNil(instance: TestClass?) {
    if instance == nil {
        print("La instancia es nil!")
    } else {
        print("La instancia NO es nil")
    }
}

var strongInstance: TestClass? = TestClass()
weak var weakInstance: TestClass? = strongInstance

checkIfReferenceIsNil(instance: weakInstance)
strongInstance = nil
checkIfReferenceIsNil(instance: weakInstance)
//: [Next](@next)

print(" ")

class BirdWatcher {
    var isScanningArea = false
    var birdDetectedNotigicationAction: () -> Void = {}  // closure
    
    deinit {
        print("Detector de aves destruido!!!")
    }
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
    
    deinit {
        print(" Contador de avez destruido!!!!")
    }
    init(birdsDetector: BirdWatcher) {
        self.birdsDetector = birdsDetector
        
        self.birdsDetector.startScanningArea() // Activamos el scaneo
        self.birdsDetector.setNotificationAction { [weak self] in
            if let unwrapperSelf = self {
                unwrapperSelf.birdsCount += 1
            } else {
                print("El bloque de codigo se ha ejectuado, pero el contador de aves es nil")
            }
        }
    }
    
    func printReport() {
        print("Aves detectadas: \(birdsCount)")
    }
}

var detector = BirdWatcher()
var counter: BirdsCounter? = BirdsCounter(birdsDetector: detector)

detector.birdFlyByNearSensor()
detector.birdFlyByNearSensor()
counter?.printReport()

counter = BirdsCounter(birdsDetector: detector) // Al cambiar la referencia ya el contador baja a 0 y pasas a tener un contador diferente
detector.birdFlyByNearSensor()
counter?.printReport()
counter = nil

/*
 unowned a diferencia de weak, esque el valor no pasa a ser nil, sino que pasa a la misma dirección de memoria, si intentas acceder a ella ,se va a producir un error en tiempo de ejecución haciendo que la aplicación cierre.
 unowned sólo se puede usar cuando estás seguro de que cuando vaya a usarse haya algo en esa dirección de memoria 
 */


protocol BirdsWatcherDelegate: AnyObject {
    func birdDetected()
}

class BirdWatcher2 {
    var isScannginArea = false
    weak var delegate: BirdsWatcherDelegate? = nil
    
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

class BirdsCounter2: BirdsWatcherDelegate {
    var birdsCount = 0
    let detector: BirdWatcher2
    
    init(detector: BirdWatcher2) {
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
