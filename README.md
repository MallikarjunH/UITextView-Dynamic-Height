# UITextView-Height-Dynamic
UITextView height dynamic according to text length, while typing or with already typed data.

Following 2 methods are important to achieve this.


func adjustUITextViewHeight(arg : UITextView)
    {
        arg.translatesAutoresizingMaskIntoConstraints = true
        arg.sizeToFit()
        arg.isScrollEnabled = false
    }

In Swift 4 the syntax of arg.scrollEnabled = false has changed to arg.isScrollEnabled = false.
