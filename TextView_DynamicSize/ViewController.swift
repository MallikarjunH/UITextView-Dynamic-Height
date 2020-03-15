//
//  ViewController.swift
//  TextView_DynamicSize
//
//  Created by Mallikarjun on 12/03/20.
//  Copyright © 2020 ADDA. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {

    @IBOutlet weak var textViewOutlet: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        textViewOutlet.text = "No:212, 2nd Floor, Indiranagar Double Road, Opposite to Cauvery School, Indirangar 2nd stage, Bangalore, Zip: 560038"
        
        textViewOutlet.becomeFirstResponder()
        self.adjustUITextViewHeight(arg: textViewOutlet)
    }
    
    //MARK: Below method used to make TextField show/display dynamic height according to text inside it
    func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }
    
    //MARK: TextView Delegate method -  Below method used to make TextField show/display dynamic height according to text inside it - while typing
    func textViewDidChange(_ textView: UITextView) {
        let fixedWidth = textView.frame.size.width
        textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        let newSize = textView.sizeThatFits(CGSize(width: fixedWidth, height: CGFloat.greatestFiniteMagnitude))
        var newFrame = textView.frame
        newFrame.size = CGSize(width: max(newSize.width, fixedWidth), height: newSize.height)
        textView.frame = newFrame
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        
        return true
    }
}

