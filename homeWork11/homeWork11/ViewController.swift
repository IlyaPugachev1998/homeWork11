import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var alarmClock: UILabel!
    @IBOutlet private weak var volumeLevel: UILabel!
    @IBOutlet private weak var progressView: UIProgressView!
    @IBOutlet private weak var slider: UISlider!
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet private weak var datePicker: UIDatePicker!
    @IBOutlet private weak var setThisTimeBtn: UIButton!
    @IBOutlet private weak var timeLabel: UILabel!
    @IBOutlet private weak var switch1: UISwitch!
    @IBOutlet private weak var cleatBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        slider.minimumValue = 0
        slider.maximumValue = 100
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
    @IBAction func datePickerAction(_ sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "HH:mm"
    }
    @IBAction func setThisTimeAction(_ sender: UIButton) {
        let getDate = datePicker.date
        let calendar = Calendar.current
        let date = calendar.dateComponents([.hour, .minute], from: getDate)
        guard let hour = date.hour,
              let minute = date.minute else { return }
        timeLabel.text = String(hour) + ":" + String(minute)
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


