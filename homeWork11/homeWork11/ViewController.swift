import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var setThisTimeBtn: UIButton!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var switch1: UISwitch!
    @IBOutlet private weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        switch1.isOn = false
        slider.minimumValue = 0
        slider.maximumValue = 100
        setThisTimeBtn.backgroundColor = .black
        setThisTimeBtn.layer.cornerRadius = 15
        setThisTimeBtn.setImage(nil, for: .normal)
        clearButton.setImage(nil, for: .normal)
    }
    @IBAction func sliderAction(_ sender: UISlider) {
        let value = sender.value
        progressView.progress = value / slider.maximumValue
        textField.text = "\(value)"
    }
    @IBAction func tetxFieldChanged(_ sender: UITextField) {
        if let text = textField.text, let value = Float(text) {
            progressView.progress = Float(value / 100)
            slider.value = Float(value)
        }
    }
    @IBAction func datePickerAction(_ sender: UIDatePicker) {}
    @IBAction func setThisTimeAction(_ sender: UIButton) {
        let getDate = datePicker.date
              let calendar = Calendar.current
              let date = calendar.dateComponents([.hour, .minute], from: getDate)
              guard let hour = date.hour,
                    let minute = date.minute else { return }
              let hourS = hour < 10 ? "0" + String(hour) : String(hour)
              let minuteS = minute < 10 ? "0" + String(minute) : String(minute)
        timeLabel.text = hourS + ":" + minuteS
        switch1.isOn = true
    }
    @IBAction func clearBtnAction(_ sender: UIButton) {
        timeLabel.text = ""
        switch1.isOn = false
    }
    @IBAction func switchBtn(_ sender: UISwitch) {
        if sender.isOn {
            timeLabel.textColor = UIColor.black
        } else {
            timeLabel.textColor = UIColor.gray
        }
    }
}


