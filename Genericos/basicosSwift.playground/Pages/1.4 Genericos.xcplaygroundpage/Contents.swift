//: [Previous](@previous)

import Foundation

// ¿Hay protocolos con tipos genéricos? - No
// Protocolos con tipos asociados, PADs
    // Representan un tipo de datos que cuando programamos no lo queremos especificar

// Vamos a hacer una pila
protocol Stack {
    associatedtype Element
    
    func push(_ element: Element)
    func pop() -> Element?
}

class IntLifoStack: Stack {
    var elements: [Int] = []
    
    func push(_ element: Int) {
        elements.append(element)
    }
    
    func pop() -> Int? {
        if elements.count <= 0 {
            return nil
        } else {
            return elements.removeLast()
        }
    }
}

// Ahora vamos a aplicar el protocolo también de forma genérica
class GenericLifoStack<StoredElement>: Stack {
    var elements: [StoredElement] = []
    
    func push(_ element: StoredElement) {
        elements.append(element)
    }
    
    func pop() -> StoredElement? {
        if elements.count <= 0 {
            return nil
        } else {
            return elements.removeLast()
        }
    }
}

// Para asignar a una variable el protocolo con tipo asociado
struct StackWrapper<SomeStack: Stack> {
    var stack: SomeStack
}

class IntStack: Stack {
    var elements: [Int] = []
    
    func push(_ element: Int) {
        elements.append(element)
    }
    
    func pop() -> Int? {
        if elements.count <= 0 {
            return nil
        } else {
            return elements.removeLast()
        }
    }
}

let myStackWrapper = StackWrapper(stack: IntStack()) // Aquí no da problema porque swift ya tiene todos los datos de forma concreta

// -------------------------------------------------------------------------
// Enlazamos GenericElement al tipo asociado al Stack
// De esta forma sólo se asocian genéricos del mismo tipo
class StatisticalStackwrapper<SomeStack: Stack, GenericElement: Numeric & BinaryInteger> where SomeStack.Element == GenericElement {
    var wrappedStack: SomeStack
    var elementCount: Int = 0
    var grandTotal: GenericElement = 0
    
    init(wrappedStack: SomeStack) {
        self.wrappedStack = wrappedStack
    }
    
    func statisticalPush(_ element: GenericElement) {
        elementCount += 1
        grandTotal += element
        
        wrappedStack.push(element)
    }
    
    func statisticalPop() -> GenericElement? {
        let result = wrappedStack.pop()
        
        if let unwrappedResult = result {
            elementCount -= 1
            grandTotal -= unwrappedResult
        }
        
        return result
    }
    
    func averageValue() -> Double {
        if elementCount <= 0 {
            return 0
        }
        return Double(grandTotal) / Double(elementCount)
    }
}

let statistics = StatisticalStackwrapper(wrappedStack: IntStack()) // Hemos dicho que Generic element es de tipo int

statistics.statisticalPush(10)
statistics.statisticalPush(-2)

print("Media: \((statistics.averageValue()))")
statistics.statisticalPop()
print("Media: \((statistics.averageValue()))")
//: [Next](@next)
