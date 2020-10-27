//
//  ViewController.swift
//  UIKitApp
//
//  Created by Kiwi on 23.10.2020.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var viewRGB: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabel: UILabel!
    @IBOutlet var greenLabel: UILabel!
    @IBOutlet var blueLabel: UILabel!
    
    @IBOutlet var redTextField: UITextField!
    @IBOutlet var greenTextField: UITextField!
    @IBOutlet var blueTextField: UITextField!
        
    @IBOutlet var redColorVIew: UIView!
    @IBOutlet var greenColorView: UIView!
    @IBOutlet var blueColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        toRoundCorners(elements: viewRGB, redColorVIew,
                       greenColorView, blueColorView,
                       radius: 10)
        
        setColorSlider()
        setSliderValue(sliders: redSlider, greenSlider, blueSlider)
        setLabelValue()
        setTextFieldValue()
        
        setViewColorRGB()
        
        addDoneButton(for: redTextField, greenTextField, blueTextField)
        
        redTextField.delegate = self
        greenTextField.delegate = self
        blueTextField.delegate = self
    }


    @IBAction func rgbSlider(_ sender: UISlider) {
        
        switch sender.tag {
        case 0:
            redLabel.text = convertValueToText(sender)
            redTextField.text = convertValueToText(sender)
        case 1:
            greenLabel.text = convertValueToText(sender)
            greenTextField.text = convertValueToText(sender)
        case 2:
            blueLabel.text = convertValueToText(sender)
            blueTextField.text = convertValueToText(sender)
        default: break
        }
        
        setViewColorRGB()
    }

    private func setColorSlider() {
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
    }
    
    private func setSliderValue(sliders: UISlider...) {
        for slider in sliders {
            slider.value = 0.5
            slider.minimumValue = 0
            slider.maximumValue = 1
        }
    }
    
    private func setLabelValue() {
        redLabel.text = convertValueToText(redSlider)
        greenLabel.text = convertValueToText(greenSlider)
        blueLabel.text = convertValueToText(blueSlider)
    }
    
    private func setTextFieldValue() {
        redTextField.text = convertValueToText(redSlider)
        greenTextField.text = convertValueToText(greenSlider)
        blueTextField.text = convertValueToText(blueSlider)
    }
    
    private func setViewColorRGB() {
        viewRGB.backgroundColor =
            UIColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value),
                    alpha: 1)
    }
    
    private func convertValueToText(_ slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    private func toRoundCorners(elements: UIView..., radius: CGFloat) {
        for element in elements {
            element.layer.cornerRadius = radius
        }
    }
}

extension ViewController: UITextFieldDelegate {

    // скрытие клавиатуры по тапу за пределами поля ввода
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
    
        view.endEditing(true) //скрывает клавиатуру выбранную для любого объекта
    }
    
    // скрытие клавиатуры кнопкой Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0: redSlider.value = currentValue
            case 1: greenSlider.value = currentValue
            case 2: blueSlider.value = currentValue
            default: break
            }
            
            setViewColorRGB()
            setLabelValue()
        } else {
            return
        }
    }
}

extension ViewController {
    
    private func addDoneButton(for textFields: UITextField...) {
        for field in textFields {
            
            let keyboardToolbar = UIToolbar()
            field.inputAccessoryView = keyboardToolbar
            keyboardToolbar.sizeToFit()
            
            let doneButton = UIBarButtonItem(title: "Done", style: .done,
                                             target: self, action: #selector(didTapDone))
            let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
            
            keyboardToolbar.items = [flexBarButton, doneButton]
        }
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
}
