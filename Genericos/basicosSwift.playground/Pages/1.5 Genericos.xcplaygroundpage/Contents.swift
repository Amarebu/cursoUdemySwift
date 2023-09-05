//: [Previous](@previous)

import Foundation

// Nuestra pila
protocol Stack {
    associatedtype Element
    
    func push(_ element: Element)
    func pop() -> Element?
}

/*
 Ejercicio:
    Línea de producción de una fábrica de coches:
        - Cada coche tiene un freno
        - Alamacén que tiene los frenos
        - Los frenos del almacén salen como en una cola Lifo
 */

class Brake {
    let serialNumber: Int
    
    init(serialNumber: Int) {
        self.serialNumber = serialNumber
    }
}

class Car {
    var brakingSystem: Brake
    
    init(brakingSystem: Brake) {
        self.brakingSystem = brakingSystem
    }
}

print("----------------------- PILA LIFO -----------------------")
class BrakesLifoStore: Stack {
    var inventory: [Brake] = []
    
    func push(_ element: Brake) {
        inventory.append(element)
    }
    
    func pop() -> Brake? {
        if inventory.count <= 0 {
            return nil
        }
        return inventory.removeLast()
    }
}

let brakesStore = BrakesLifoStore()
brakesStore.push(Brake(serialNumber: 0))
brakesStore.push(Brake(serialNumber: 1))

func buildCar<BrakesStore: Stack>(brakesStore: BrakesStore) -> Car? where BrakesStore.Element == Brake {
    if let brake = brakesStore.pop() {
        print("Contruido un coche con un freno con número de serie \(brake.serialNumber)")
        return Car(brakingSystem: brake)
    } else {
        print("No hay un freno para construir un coche")
        return nil
    }
}

buildCar(brakesStore: brakesStore)
buildCar(brakesStore: brakesStore)
buildCar(brakesStore: brakesStore)

// Ahora vamos a hacer una pila FIFO
print("----------------------- PILA FIFO -----------------------")
class BrakesFifoStore: Stack {
    var inventory: [Brake] = []
    
    func push(_ element: Brake) {
        inventory.append(element)
    }
    
    func pop() -> Brake? {
        if inventory.count <= 0 {
            return nil
        }
        return inventory.removeFirst()
    }
}

let fifoBrakeStore = BrakesFifoStore()
fifoBrakeStore.push(Brake(serialNumber: 15))
fifoBrakeStore.push(Brake(serialNumber: 20))

buildCar(brakesStore: fifoBrakeStore)
buildCar(brakesStore: fifoBrakeStore)
buildCar(brakesStore: fifoBrakeStore)
//: [Next](@next)
