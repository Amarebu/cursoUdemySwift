//: [Previous](@previous)

import Foundation

// ¿Los enumerados genéricos para que sirven?

// Vamos a tratar una llamada a un servicio remoto
    // Puedo ver tipo de datos distintos
    // Puedo ver si se ha producido un error o no

enum ServerResponse<SuccessType> {
    case success(value: SuccessType)
    case error
}

func serverIntResponse() -> Int {
    return 42
}

func callRemoteIntResponse() -> ServerResponse<Int> {
    return .success(value: serverIntResponse())
}

let result = callRemoteIntResponse()

// El tipo opcional es un enumerado genérico
let myOptionalInt: Int? = nil
let otherOptional: Optional<Int> = .none // Valor del opcional que tiene nil
let otherOptionalTwo: Optional<Int> = .some(42)

//: [Next](@next)
