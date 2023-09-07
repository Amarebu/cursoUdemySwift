import UIKit

func divideV1(dividend: Double, divisor: Double) -> Double? {
    if divisor == 0 {
        return nil
    } else {
        return dividend / divisor
    }
}

/*
  Ejercicio: Somos una empresa que que reparte derechos de emisión de CO2 entre empresas que lo requieran, hay dos condiciones:
    1. Si no hay empresas interesadas en comprar, entonces los derechos se acumulan pra el dia siguiente
    2. Si hay una empres que si está interesada pero el total de cada empresa es demasiado alto, ninguna empresa se lleva nada y tampoco se acumulan al dia siguiente
 */

class CO2MarketplaceV1 {
    var totalCO2TonsAvailable: Double = 0.0
    
    func calculateCO2TonsPerPArticipant(todatAddedCO2Tons: Double, totalInterestedEnterprises: Int) -> Double {
        let marketVolume = todayRealCO2Market(todayAddedCo2Tons: todatAddedCO2Tons)
        
        if let tonsPerEnterprise = divideV1(dividend: marketVolume, divisor: Double(totalInterestedEnterprises)) {
            if tonsPerEnterprise < 100 {
                totalCO2TonsAvailable = 0
                return tonsPerEnterprise
            } else {
                return 0
            }
        } else {
            totalCO2TonsAvailable += todatAddedCO2Tons
            return 0
        }
    }
    func todayRealCO2Market(todayAddedCo2Tons: Double) -> Double {
        return todayAddedCo2Tons + totalCO2TonsAvailable
    }
}

let marketplace = CO2MarketplaceV1()
print("--------------------- Tenemos 500 toneladas y 3 empresas interesadas ---------------------")
var totalPerParticipant = marketplace.calculateCO2TonsPerPArticipant(todatAddedCO2Tons: 500, totalInterestedEnterprises: 3)
print("Cada participante se lleva \(totalPerParticipant), porque el numero de toneladas para cada empresa sería mayor que las 100 como límite")
print(" ")
print("--------------------- Tenemos 100 toneladas y 0 empresas interesadas ---------------------")
var totalPerParticipant2 = marketplace.calculateCO2TonsPerPArticipant(todatAddedCO2Tons: 100, totalInterestedEnterprises: 0)
print("Cada participante se lleva \(totalPerParticipant2), porque no hay nadie interesado, se acumulan los 100")
print(" ")
print("--------------------- Tenemos 10 toneladas y 4 empresas interesadas ---------------------")
var totalPerParticipant3 = marketplace.calculateCO2TonsPerPArticipant(todatAddedCO2Tons: 10, totalInterestedEnterprises: 4)
print("Cada participante se lleva \(totalPerParticipant3)")
