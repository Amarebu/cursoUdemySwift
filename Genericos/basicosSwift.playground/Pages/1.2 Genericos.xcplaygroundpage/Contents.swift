import Foundation

// Limitar el tipo genérico

func max<Compared: Comparable>(_ first: Compared, _ second: Compared) -> Compared {
    if first >= second {
        return first
    } else {
        return second
    }
}


print(" El máximo entre 7 y 8:  \(max(7,8))")
print(" El máximo entre 7 y 8:  \(max(4.5,13))")
