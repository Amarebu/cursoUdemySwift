import Foundation

// Limitar el tipo genérico

func max<Compared: Comparable>(_ first: Compared, _ second: Compared) -> Compared {
    if first >= second {
        return first
    } else {
        return second
    }
}

// Vemos que la única condición es que ambos elementos sean comparabales
print(" El máximo entre 7 y 8:  \(max(7,8))")
print(" El máximo entre 4.5 y 13:  \(max(4.5,13))")

class MyInt {
    var value: Int
    
    init(value: Int) {
        self.value = value
    }
}
// Esto no se puede hacer porque no es Comparable
// max(MyInt(value: 16), MyInt(value: 42))

struct Addder {
    static func add<Addend: Numeric>(addend1: Addend, addend2: Addend) -> Addend {
        return addend1 + addend2
    }
}

let result = Addder.add(addend1: 42, addend2: 4)
let result2 = Addder.add(addend1: 3.14, addend2: 4.2)

/*
    Un diccionario es una estructura genérica donde las claves son de tipo genérico, limitado a tipos que se ajusten al protocolo hashable y los valores son tipo genérico que no está limitiado
 */

// Hacer nuestro propio diccionario

struct OurDictionary<Key: Hashable, Value> {
    func setValue(_ value: Value, forKey key: Key) {
        // ..
    }
    
    func valueForKey(_ key: Key) -> Value? {
        // ..
        return nil
    }
}

let numberMap: [Int: String] = [
    1: "Uno",
    2: "Dos"
]

let otherNumberMap: Dictionary<Int,String> = [
    3: "Tres",
    4: "Cuatro"
]
