//
//  ViewController.swift
//  UIKitApp
//
//  Created by Kiwi on 23.10.2020.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet var viewRGB: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var blueSlider: UISlider!
    
    @IBOutlet var redLabelValue: UILabel!
    @IBOutlet var greenLabelValue: UILabel!
    @IBOutlet var blueLabelValue: UILabel!
    
    @IBOutlet var redValueFromText: UITextField!
    @IBOutlet var greenValueFromText: UITextField!
    @IBOutlet var blueValueFromText: UITextField!
        
    @IBOutlet var redColorVIew: UIView!
    @IBOutlet var greenColorView: UIView!
    @IBOutlet var blueColorView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewRGB.layer.cornerRadius = 10
        redColorVIew.layer.cornerRadius = 10
        greenColorView.layer.cornerRadius = 10
        blueColorView.layer.cornerRadius = 10
        
        // Setup sliders
        redSlider.minimumTrackTintColor = .red
        greenSlider.minimumTrackTintColor = .green
        blueSlider.minimumTrackTintColor = .blue
        
        redSlider.value = 0.76
        redSlider.minimumValue = 0
        redSlider.maximumValue = 1
        
        greenSlider.value = 0.26
        greenSlider.minimumValue = 0
        greenSlider.maximumValue = 1
        
        blueSlider.value = 0.49
        blueSlider.minimumValue = 0
        blueSlider.maximumValue = 1
        
        // Setup labels
        redLabelValue.text = sliderValueToText(slider: redSlider)
        greenLabelValue.text = sliderValueToText(slider: greenSlider)
        blueLabelValue.text = sliderValueToText(slider: blueSlider)

        // Setup edit fields
        redValueFromText.text = redLabelValue.text
        greenValueFromText.text = greenLabelValue.text
        blueValueFromText.text = blueLabelValue.text
        
        redValueFromText.delegate = self
        
        setColorOnTheView()
    }

    @IBAction func redSliderAction() {
        redLabelValue.text = sliderValueToText(slider: redSlider)
        redValueFromText.text = redLabelValue.text
        setColorOnTheView()
    }
    @IBAction func greenSliderAction() {
        greenLabelValue.text = sliderValueToText(slider: greenSlider)
        greenValueFromText.text = greenLabelValue.text
        setColorOnTheView()
    }
    @IBAction func blueSliderAction() {
        blueLabelValue.text = sliderValueToText(slider: blueSlider)
        blueValueFromText.text = blueLabelValue.text
        setColorOnTheView()
    }
    
    func setColorOnTheView() {
        viewRGB.backgroundColor =
            UIColor(red: CGFloat(redSlider.value),
                    green: CGFloat(greenSlider.value),
                    blue: CGFloat(blueSlider.value),
                    alpha: 1)
    }
    
    func sliderValueToText(slider: UISlider) -> String {
        return String(format: "%.2f", slider.value)
    }
    
    @IBAction func redTextEditAction() {
        redLabelValue.text = redValueFromText.text
        setColorOnTheView()
    }
    
    @IBAction func greenTextEditAction() {
        greenLabelValue.text = greenValueFromText.text
        setColorOnTheView()
    }
    
    @IBAction func blueTextEditAction() {
        blueLabelValue.text = blueValueFromText.text
        setColorOnTheView()
    }
    
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        return true
//    }
}
