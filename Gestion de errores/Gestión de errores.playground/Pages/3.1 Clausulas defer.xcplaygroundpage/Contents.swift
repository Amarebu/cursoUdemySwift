//: [Previous](@previous)

import Foundation

enum NonNegativeAdditionError: Error {
    case numberIsNegative
    
    func asString() -> String {
        switch self {
        case .numberIsNegative:
            return " El parámetero es negativo"
        }
    }
}

func addOnlyWhenNonNegative(value: Int) throws -> Int {
    let startTime = Date()
    defer {     // Se ejecuta cuando se termina la ejecución, se ejecuta siempre, salte error o no
        let timeInterval = Date().timeIntervalSince(startTime)
        print("Tiempo de ejecución en  segundos: \(timeInterval)")
    }
    
    guard value >= 0 else {
        throw NonNegativeAdditionError.numberIsNegative
    }
    
    var result = 0
    
    for number in 0...value {
        result += number
    }
    return result
}

print("Solo cuando no es negativo")
do {
    let result = try addOnlyWhenNonNegative(value: -50)
    print("Resultado: \(result)")
} catch let error as NonNegativeAdditionError {
    print(error.asString())
} catch {
    print("Errores desconocidos")
}
//: [Next](@next)
