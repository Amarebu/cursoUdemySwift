//: [Previous](@previous)

import Foundation

enum DivisionError: Error, Equatable {
    case divisionByZero
}

func divideV2(dividend: Double, divisor: Double) throws -> Double {
    if divisor == 0 {
        throw DivisionError.divisionByZero // Utilizamos throw para lanzar un error
    } else {
        return dividend / divisor
    }
}

enum CO2MarketplaceError: Error, Equatable {
    case noEnterpriseInterested
    case tooMuchCO2ForOnlyOneEnterprise
    case unkownError
    
    func asString() -> String {
        switch self {
        case .noEnterpriseInterested:
            return "No hay empresas interesadas"
        case .tooMuchCO2ForOnlyOneEnterprise:
            return "Demasiado CO2 para cada empresa"
        case .unkownError:
            return "Error desconocido en el mercado CO2"
        }
    }
}

class CO2MarketplaceV2 {
    var totalCO2TonsAvailable: Double = 0.0
    
    func calculateCO2TonsPerParticipant(todaytAddedCO2Tons: Double, totalInterestedEnterprises: Int) throws -> Double {
        let marketVolume = todayRealCO2Market(todayaddedCO2Tons: todaytAddedCO2Tons)
        
        do {
            let tonsPerEnterprise = try divideV2(dividend: marketVolume, divisor: Double(totalInterestedEnterprises))
            
            if tonsPerEnterprise > 100 {
                throw CO2MarketplaceError.tooMuchCO2ForOnlyOneEnterprise
            }
            totalCO2TonsAvailable = 0
            return tonsPerEnterprise
        } catch let error as DivisionError where error == .divisionByZero {
            totalCO2TonsAvailable += todaytAddedCO2Tons
            throw CO2MarketplaceError.noEnterpriseInterested
        } catch let error as CO2MarketplaceError where error == CO2MarketplaceError.tooMuchCO2ForOnlyOneEnterprise {
            throw error
        } catch {
            throw CO2MarketplaceError.unkownError
        }
    }
    
    func todayRealCO2Market(todayaddedCO2Tons: Double) -> Double {
        return todayaddedCO2Tons + totalCO2TonsAvailable
    }
}

let marketplace2 = CO2MarketplaceV2()

print(" ------------------ Prueba sin empresas ------------------ ")
do {
    let tonsPerEnterprise = try marketplace2.calculateCO2TonsPerParticipant(todaytAddedCO2Tons: 200, totalInterestedEnterprises: 0)
    print("Toneladas por empresa: \(tonsPerEnterprise)")
} catch let error as CO2MarketplaceError {
    print(error.asString())
} catch {
    print("Esto es otro tipo de error que no deberia de salir pero el catch debe ser exhaustivo")
}
print(" ")
print(" ------------------ Prueba con 1 empresa pero se pasa de kilos ------------------ ")
do {
    let tonsPerEnterprise = try marketplace2.calculateCO2TonsPerParticipant(todaytAddedCO2Tons: 200, totalInterestedEnterprises: 1)
    print("Toneladas por empresa: \(tonsPerEnterprise)")
} catch let error as CO2MarketplaceError {
    print(error.asString())
} catch {
    print("Esto es otro tipo de error que no deberia de salir pero el catch debe ser exhaustivo")
}
print(" ")
print(" ------------------ Prueba normal ------------------ ")
do {
    let tonsPerEnterprise = try marketplace2.calculateCO2TonsPerParticipant(todaytAddedCO2Tons: 200, totalInterestedEnterprises: 10)
    print("Toneladas por empresa: \(tonsPerEnterprise)")
} catch let error as CO2MarketplaceError {
    print(error.asString())
} catch {
    print("Esto es otro tipo de error que no deberia de salir pero el catch debe ser exhaustivo")
}

// Otra forma de llamarlo
print(" ")
print(" ------------------ Opción para llamada que devuelven errores ------------------ ")
var tons = try? marketplace2.calculateCO2TonsPerParticipant(todaytAddedCO2Tons: 200, totalInterestedEnterprises: 40)
if let unwrapperTons = tons {
    print("Toneladas por empresa \(unwrapperTons)")
} else {
    print("Error comun, perdemos el tipo de error en este caso")
}
//: [Next](@next)
