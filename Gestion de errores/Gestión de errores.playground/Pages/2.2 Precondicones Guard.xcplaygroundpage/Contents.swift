//: [Previous](@previous)

import Foundation

enum ForbiddenAdditionError: Error {
    case arrayIsNil
    case arrayIsEmpty
    case arrayContainsForbiddenNumbers
    
    func asString() -> String {
        switch self {
        case .arrayIsNil:
            return "La lista es nil"
        case .arrayIsEmpty:
            return "La lista está vacía"
        case .arrayContainsForbiddenNumbers:
            return "La lista contiene números prohibidos"
        }
    }
}

func addOnlyNotForbiddenV3(numbers: [Int]?) throws -> Int {
    var result = 0
    
    guard let unwrappedNumbers = numbers else {
        throw ForbiddenAdditionError.arrayIsNil
    }
    guard unwrappedNumbers.count > 0 else {
        throw ForbiddenAdditionError.arrayIsEmpty
    }
    guard (unwrappedNumbers.contains(4) == false) && ( unwrappedNumbers.contains(8) == false) else {
        throw ForbiddenAdditionError.arrayContainsForbiddenNumbers
    }
    
    for number in unwrappedNumbers {
        result += number
    }
    return result
}

print("------------------ Version 3  ------------------")
print(" ")
print("------ Cuando es nil ------")
do {
    let result = try addOnlyNotForbiddenV3(numbers: nil)
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}
print(" ")
print("------ Cuando hay número prohibido  ------")
do {
    let result = try addOnlyNotForbiddenV3(numbers: [3,4,5,6])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}

print(" ")
print("------ Todo normal ------")
do {
    let result = try addOnlyNotForbiddenV3(numbers: [3,5,6,7,10])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}
//: [Next](@next)
