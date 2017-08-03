//
//  Const.swift
//
// See LICENSE.txt for license information

import Foundation

public class Measurement {
    let value: Double
//    public var value: Double {
//        get {
//            return value
//        }
//    }
    let unit: String
//    var unit: String {
//        get {
//            return unit
//        }
//    }

    public init(value: Double, unit: String) {
        self.value = value
        self.unit = unit
    }
}

//public let ConstAvogadro = Measurement(value: 6.02214179e23, units:"mol^-1")
//public let ConstBoltzmann = Measurement(value: 1.3806504e-23, units:"J K^-1")
//public let ConstBoltzmannEvk = Measurement(value: 8.617343e-5, units:"eV K^-1")
public let constC = Measurement(value: 2.99792458e8, unit: "m/s")
//public let ConstElectronMass = Measurement(value: 9.10938215e-31, units:"kg")
//public let ConstElectronVolt = Measurement(value: 1.602176487e-19, units:"J")
//public let ConstG = Measurement(value: 6.67428e-11, units:"m^3 kg^-1 s^-2")
//public let ConstPlanck = Measurement(value: 6.62606896e-34, units:"J s")
//public let ConstPlanckEvs = Measurement(value: 4.13566733e-15, units:"eV s")
//public let ConstSmallG = Measurement(value: 9.80665, units:"m s^-2")
//public let ConstStefanBoltzmann = Measurement(value: 5.670400e-8, units:"W m^-2 K^-4")
