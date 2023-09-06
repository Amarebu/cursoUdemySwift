//: [Previous](@previous)

import Foundation

/*
    La gestión de memoria de los tipos por referencias, se gestiona usando referencia de cuenta automática o ARC
    Cada vez que una constante o variable adquiera una referencia a una instancia hay un contador que se incrementa
 */

class MyClass {
    let serialNumber: Int
    
    deinit {
        print("La instancia con numero de serie: \(serialNumber) se ha destruido")
    }
    
    init(serialNumber: Int) {
        self.serialNumber = serialNumber
    }
    
    func printSerial() {
        print("Instancia con número de serie: \(serialNumber)")
    }
}

var reference1: MyClass? = MyClass(serialNumber: 0)
var reference2 = reference1
var reference3 = reference2 // Aquí el contador está a 3, porque hay 3 referencias

reference1?.printSerial()
reference2?.printSerial()
reference3?.printSerial()

reference1 = MyClass(serialNumber: 1) // Tenemos dos instancias la 1 y la 0, donde la 1 apunta r1 y el resto a la 0
print(" ")
reference1?.printSerial()
reference2?.printSerial()
reference3?.printSerial()


// Vamos a eliminar las otras 2 referencias
print(" ")
reference2 = nil
reference3 = nil
//: [Next](@next)
