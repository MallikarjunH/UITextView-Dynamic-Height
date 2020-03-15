//
//  ViewController2.swift
//  TextView_DynamicSize
//
//  Created by Mallikarjun on 15/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController2: UIViewController{
    
    
    @IBOutlet weak var mobileNumberTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextView!
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var zipTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    
    var phone = ""
    var email = ""
    var city = ""
    var zip = ""
    var state = ""
    var address = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "Example 2"
        self.adjustUITextViewHeight(arg: addressTextField)
       
    }

    @IBAction func updateButtonClicked(_ sender: Any) {
        
        print("Name: \(self.phone)")
        print("Email: \(self.email)")
        print("Address: \(self.address)")
        print("City: \(self.city)")
        print("Zip: \(self.zip)")
        print("State: \(self.state)")
    }
    
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
}

extension ViewController2:UITextFieldDelegate, UITextViewDelegate {

    //MARK: TextField Delegate methods
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        if textField == mobileNumberTextField {
            phone = textField.text ?? ""
            
        }else if textField == emailTextField {
            email = textField.text ?? ""
            
        }else if textField == cityTextField {
            city = textField.text ?? ""
            
        }else if textField == zipTextField {
            zip = textField.text ?? ""
            
        }else if textField == stateTextField {
            state = textField.text ?? ""
        }
        
    }
    
    //MARK: TextView Delegate methods
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
    
}
