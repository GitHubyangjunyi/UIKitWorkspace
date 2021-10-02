//
//  AddItemViewController.swift
//  DiffableDataSourceSection
//
//  Created by 杨俊艺 on 2021/7/17.
//

import UIKit

protocol AddItemViewControllerDelegate: AnyObject {
    func didAddNewItem(_ addItemViewController: AddItemViewController, item: Item)
}

class AddItemViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var pickerView: UIPickerView!
    
    
    weak var delegate: AddItemViewControllerDelegate?
    
    private var selectedCategory: Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerView.dataSource = self
        pickerView.delegate = self
        selectedCategory = .allCases.first
    }
    
    
    @IBAction func addItemToShoppingList(_ sender: Any) {
        guard let name = nameTextField.text, !name.isEmpty, let priceText = priceTextField.text, !priceText.isEmpty, let price = Double(priceText), let selectedCategory = selectedCategory else { return }
        
        let item = Item.init(name: name, price: price, category: selectedCategory)
        
        delegate?.didAddNewItem(self, item: item)
        dismiss(animated: true, completion: nil)
    }
}

extension AddItemViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Category.allCases.count
    }
}

extension AddItemViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Category.allCases[row].rawValue
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectedCategory = Category.allCases[row]
    }
}

