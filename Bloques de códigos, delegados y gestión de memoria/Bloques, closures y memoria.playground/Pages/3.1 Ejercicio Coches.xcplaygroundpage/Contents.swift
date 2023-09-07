//: [Previous](@previous)

import Foundation


protocol CarElementReception {
    associatedtype ReceivedElement
    func receiveBatch(_ batch: [ReceivedElement])
}

protocol CarElementsProvider {
    associatedtype CarElement
    
    var elementsCount: Int { get }
    var newelementsAvailableAction: () -> Void { get set}
    
    func elementsToBuildCar(totalNumber: Int) -> [CarElement]
}

class CarElementsStore<CarElement> {
    var elementsStorage: [CarElement] = []
    var newelementsAvailableAction: () -> Void = {}
}

extension CarElementsStore: CarElementReception {
    
    func receiveBatch(_ batch: [CarElement]) {
        if batch.count > 0 {
            elementsStorage.append(contentsOf: batch)
            newelementsAvailableAction()
        }
    }
}

extension CarElementsStore: CarElementsProvider {
    var elementsCount: Int {
        get  {
            return elementsStorage.count
        }
    }
    
    func elementsToBuildCar(totalNumber: Int) -> [CarElement] {
        if elementsCount >= totalNumber {
            let result = Array(elementsStorage[0..<totalNumber])
            elementsStorage.removeFirst(totalNumber)
            return result
        } else {
            return []
        }
    }
}

struct Brake {
    let serialNumber: Int
}

struct Wheel {
    let serialNumber: Int
}

let brakesStore = CarElementsStore<Brake>()
let wheelsStore = CarElementsStore<Wheel>()

class BrakeManufacturer<BrakesRepection: CarElementReception> where BrakesRepection.ReceivedElement == Brake {
    let brakesReception: BrakesRepection
    var currentSerialNumber = 1_000
    
    init(brakesReception: BrakesRepection) {
        self.brakesReception = brakesReception
    }
    
    func manufactureBrakes(count: Int) {
        var batch: [Brake] = []
        
        for _ in 0..<count {
            let brake = Brake(serialNumber: currentSerialNumber)
            batch.append(brake)
            currentSerialNumber += 1
        }
        
        brakesReception.receiveBatch(batch)
    }
}

class WheelManufacturer<WheelRepection: CarElementReception> where WheelRepection.ReceivedElement == Wheel {
    let wheelReception: WheelRepection
    var currentSerialNumber = 1_000
    
    init(wheelReception: WheelRepection) {
        self.wheelReception = wheelReception
    }
    
    func manufactureWheels(count: Int) {
        var batch: [Wheel] = []
        
        for _ in 0..<count {
            let wheel = Wheel(serialNumber: currentSerialNumber)
            batch.append(wheel)
            currentSerialNumber += 1
        }
        
        wheelReception.receiveBatch(batch)
    }
}

let brakesManufacturer = BrakeManufacturer(brakesReception: brakesStore)
let wheelsManufacturer = WheelManufacturer(wheelReception: wheelsStore)

struct Car {
    let serialNumber: Int
    let brakes: [Brake]
    let wheels: [Wheel]
    
    func printCarInfo() {
        print("Coche manufacturado con número de serie \(serialNumber)")
        
        for brake in brakes {
            print(" Freno con número de serie: \(brake.serialNumber)")
        }
        
        for wheel in wheels {
            print(" Rueda con número de serie: \(wheel.serialNumber)")
        }
    }
}

class CarManufacturingLine<BrakesProvider: CarElementsProvider, WheelsProvider: CarElementsProvider> where BrakesProvider.CarElement == Brake, WheelsProvider.CarElement == Wheel {
    var brakeProvider: BrakesProvider
    var wheelsProvider: WheelsProvider
    var currentSerialNumber = 1
    let brakesNumberToBuildCar = 4
    let wheelsNumberToBuildCar = 4
    
    init(brakesProvider: BrakesProvider, wheelsProvider: WheelsProvider) {
        self.brakeProvider = brakesProvider
        self.wheelsProvider = wheelsProvider
        
        let notificationAction: () -> Void = { [weak self] in
            if let unwrappedSelf = self {
                unwrappedSelf.restartManufacturingWhenPossible()
            }
        }
        self.brakeProvider.newelementsAvailableAction = notificationAction
        self.wheelsProvider.newelementsAvailableAction = notificationAction
    }
    
    func canBuildCarwithStoredElements() -> Bool {
        if (brakeProvider.elementsCount >= brakesNumberToBuildCar) && (wheelsProvider.elementsCount >= wheelsNumberToBuildCar) {
            return true
        } else {
            return false
        }
    }
    
    func restartManufacturingWhenPossible() {
        if canBuildCarwithStoredElements() == true {
            buildCar()
        } else {
            print("No hay piezas suficientes para manufacturar un coche")
        }
    }
    
    func buildCar() {
        while canBuildCarwithStoredElements() == true {
            let brakes = brakeProvider.elementsToBuildCar(totalNumber: brakesNumberToBuildCar)
            let wheels = wheelsProvider.elementsToBuildCar(totalNumber: wheelsNumberToBuildCar)
            let car = Car(serialNumber: currentSerialNumber, brakes: brakes, wheels: wheels)
            car.printCarInfo()
            currentSerialNumber += 1
        }
    }
}

let factory = CarManufacturingLine(brakesProvider: brakesStore, wheelsProvider: wheelsStore)

print("------------------------- El fabricante de frenos nos da 3 frenos -------------------------")
brakesManufacturer.manufactureBrakes(count: 3)
print("------------------------- El fabricante de ruedas nos da 19 ruedas -------------------------")
wheelsManufacturer.manufactureWheels(count: 19) // Tenemos muchas ruedas pero no los frenos suficientes
print("------------------------- El fabricante de frenos nos da 17 frenos -------------------------")
brakesManufacturer.manufactureBrakes(count: 17) // Aquí tenemos 20 frenos y 19 ruedas por lo que ya podemos fabricar coches
print("------------------------- El fabricante de ruedas nos da 5 ruedas -------------------------")
wheelsManufacturer.manufactureWheels(count: 5) 
 //: [Next](@next)
