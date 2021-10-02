//
//  SettingViewController.swift
//  UserDefaultUse
//
//  Created by 杨俊艺 on 2021/7/19.
//

import UIKit

class SettingViewController: UITableViewController {

    @IBOutlet weak var unitMeasurementLabel: UILabel!
    
    var currentUnit = UnitMeasurement.miles {
        didSet {
            unitMeasurementLabel.text = currentUnit.rawValue
            UserPrefrence.shared.updateUnitMeasurement(with: currentUnit)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let unitMeasurement = UserPrefrence.shared.getUnitMesureMent() {
            currentUnit = unitMeasurement
        }
        
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            toggleUnitMesurement()
        default:
        break
        }
    }
    
    private func toggleUnitMesurement() {
        currentUnit = currentUnit == UnitMeasurement.miles ? .kilometers : .miles
    }
}
