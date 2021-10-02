//
//  UserPrefrence.swift
//  UserDefaultUse
//
//  Created by 杨俊艺 on 2021/7/19.
//

import Foundation

enum UnitMeasurement: String {
    case miles = "Miles"
    case kilometers = "Kilometers"
}

struct UserPrefrenceKey {
    static let unitMeasurement = "Unit Measurement"
}

class UserPrefrence {
    private init() {}
    
    static let shared = UserPrefrence.init()
    
    private let standard = UserDefaults.standard
    
    func updateUnitMeasurement(with unit: UnitMeasurement) {
        standard.setValue(unit.rawValue, forKey: UserPrefrenceKey.unitMeasurement)
    }
 
    func getUnitMesureMent() -> UnitMeasurement? {
        guard let unitMeasurement = standard.object(forKey: UserPrefrenceKey.unitMeasurement) as? String else { return nil }
        return UnitMeasurement.init(rawValue: unitMeasurement)
    }
}
