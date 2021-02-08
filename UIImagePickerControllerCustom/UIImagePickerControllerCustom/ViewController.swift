//
//  ViewController.swift
//  UIImagePickerControllerCustom
//
//  Created by 杨俊艺 on 2020/7/1.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!

    var imagePicker: ImagePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.imagePicker = ImagePicker(presentationController: self, delegate: self)
        
    }
    
    @IBAction func showImagePicker(_ sender: UIButton) {
        self.imagePicker.present(from: sender)
    }

}

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}

extension ViewController: ImagePickerDelegate {

    func didSelect(image: UIImage?) {
        self.imageView.image = image
    }
}


//自定义图像选择器
open class ImagePicker: NSObject {

    private let pickerController: UIImagePickerController
    private weak var presentationController: UIViewController?
    private weak var delegate: ImagePickerDelegate?

    public init(presentationController: UIViewController, delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()
        self.presentationController = presentationController
        super.init()
        
        
        self.pickerController.mediaTypes = ["public.image"]
        self.pickerController.allowsEditing = true
        self.pickerController.delegate = self
        
        self.delegate = delegate

    }

    public func present(from sourceView: UIView) {

        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        if let action = self.action(for: .camera, title: "Take photo") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .savedPhotosAlbum, title: "Camera roll") {
            alertController.addAction(action)
        }
        if let action = self.action(for: .photoLibrary, title: "Photo library") {
            alertController.addAction(action)
        }

        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))

        //iPad支持
        if UIDevice.current.userInterfaceIdiom == .pad {
            alertController.popoverPresentationController?.sourceView = sourceView
            alertController.popoverPresentationController?.sourceRect = sourceView.bounds
            alertController.popoverPresentationController?.permittedArrowDirections = [.down, .up]
        }

        self.presentationController?.present(alertController, animated: true)
    }

    private func action(for type: UIImagePickerController.SourceType, title: String) -> UIAlertAction? {
        guard UIImagePickerController.isSourceTypeAvailable(type) else {
            return nil
        }

        return UIAlertAction(title: title, style: .default) { [unowned self] _ in
            self.pickerController.sourceType = type
            self.presentationController?.present(self.pickerController, animated: true)
        }
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)

        self.delegate?.didSelect(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController,
                                      didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.editedImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {

}

//如果您不需要从源类型中进行选择那么事情就很简单了
//您只需展示您的选择器视图控制器处理委托中的所有内容即可完成
//但是如果您需要从输入源中进行选择则需要更多的逻辑尤其是在iPad上

//我正在使用UIAlertController以便编写源类型选择对话框
//我试图添加3个动作基于选择源类型但前提是该源类型在给定设备上可用/例如.camera模拟器中不可用
//您可以通过以下方式检查可用性UIImagePickerController.isSourceTypeAvailable(type)

//警报控制器在iPad上需要一些额外的东西这就是为什么我要在本方法中设置popoverPresentationController属性的原因
//通常只需设置sourceView和sourceRect属性即可但是您也可以自定义箭头方向
//检查设备是否为iPad并设置正确的源视图并根据需要进行调整一直是您的任务否则您的应用将在iPad上崩溃
//另一件事是您必须UIPickerViewController在选择器完成工作后将其释放

//ImagePickerDelegate在这种情况下委托是我能想到的最简单
//但是在某些情况下您可能需要图像选择器提供一些附加信息
//如果您想进一步采取这种方法则可以创建定义基本功能的抽象类或协议
//并在此基础上实现各种媒体选择器控制器以满足您的需求

