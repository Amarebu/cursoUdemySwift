//: [Previous](@previous)

import Foundation

// Precondiciones que deben ocurrir para seguir con el código

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

func addOnlyNotForbiddenV1(numbers: [Int]?) throws -> Int {
    if let unwrappedNumbers = numbers {
        if unwrappedNumbers.count > 0 {
            if (unwrappedNumbers.contains(4) == false) && ( unwrappedNumbers.contains(5) == false ) {
                var result = 0
                
                for number in unwrappedNumbers {
                    result += number
                }
                return result
            } else {
                throw ForbiddenAdditionError.arrayContainsForbiddenNumbers
            }
        } else {
            throw ForbiddenAdditionError.arrayIsEmpty
        }
    } else {
        throw ForbiddenAdditionError.arrayIsNil
    }
}

print("------------------ Version 1  ------------------")
print(" ")
print("------ Cuando es nil ------")
do {
    let result = try addOnlyNotForbiddenV1(numbers: nil)
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}
print(" ")
print("------ Cuando hay número prohibido  ------")
do {
    let result = try addOnlyNotForbiddenV1(numbers: [3,4,5,6])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}

print(" ")
print("------ Todo normal ------")
do {
    let result = try addOnlyNotForbiddenV1(numbers: [3,5,6])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}
//: [Next](@next)


func addOnlyNotForbiddenV2(numbers: [Int]?) throws -> Int {
    if let unwrappedNumbers = numbers {
        if unwrappedNumbers.count == 0 {
            throw ForbiddenAdditionError.arrayIsEmpty
        }
        if (unwrappedNumbers.contains(4) == true) && ( unwrappedNumbers.contains(5) == true ) {
                throw ForbiddenAdditionError.arrayContainsForbiddenNumbers
            }
            var result = 0
            for number in unwrappedNumbers {
                result += number
            }
            return result
        
    } else {
        throw ForbiddenAdditionError.arrayIsNil
    }
}

print(" ")
print("------------------ Version 2  ------------------")
print(" ")
print("------ Cuando es nil ------")
do {
    let result = try addOnlyNotForbiddenV2(numbers: nil)
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}
print(" ")
print("------ Cuando hay número prohibido  ------")
do {
    let result = try addOnlyNotForbiddenV2(numbers: [3,4,5,6])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}

print(" ")
print("------ Todo normal ------")
do {
    let result = try addOnlyNotForbiddenV2(numbers: [3,5,6])
    print("Resultado: " + String(result))
} catch let error as ForbiddenAdditionError {
    print(error.asString())
} catch {
    print(" Error desconocdido")
}

