//: [Previous](@previous)

import Foundation

/*
 Vamos a estudiar los genéricos
 
 Beneficios:
    - No repetir código
 */

class IntLifoQueue {
    var elements: [Int] = []
    
    func push(_ element: Int) {
        elements.append(element)
    }
    
    func pop() -> Int? {
        if elements.count <= 0 {
            return nil
        }
        let lastElement = elements.removeLast()
        return lastElement
    }
}

let intengerImp = IntLifoQueue()
intengerImp.push(4)
intengerImp.push(5)

// print(String(intengerImp.pop() ?? -1))
// print(String(intengerImp.pop() ?? -1))
// print(String(intengerImp.pop() ?? -1))

/*
 Genérico: Clase, estructura, enumerado, función o método, donde uno o varios de los tipos de datos que maneja no están definidos en el momento de definir el código. El tipo  no definido toma nombre de genérico.
 */

class LifoQueue<StoredType> {
    var elements: [StoredType] = []
    
    func push(_ element: StoredType) {
        elements.append(element)
    }
    func pop() -> StoredType? {
        if elements.count <= 0 {
            return nil
        }
        let lastElemet = elements.removeLast()
        return lastElemet
    }
}

let integerLifo: LifoQueue<Int> = LifoQueue()
integerLifo.push(6)
integerLifo.push(7)
print("This is an example: ", integerLifo.elements)
print(String(integerLifo.pop() ?? -1))
print(String(integerLifo.pop() ?? -1))

let stringLifo: LifoQueue<String> = LifoQueue()
stringLifo.push("Seis")
stringLifo.push("Siete")
print("This is an example of string: ", stringLifo.elements)
print(stringLifo.pop() ?? "_")
print(stringLifo.pop() ?? "_")
//: [Next](@next)
