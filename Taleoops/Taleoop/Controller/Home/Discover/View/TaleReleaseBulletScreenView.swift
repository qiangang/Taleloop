
import UIKit

class TaleReleaseBulletScreenView: UIView {

    @IBOutlet weak var niimgView: UIImageView!
    @IBOutlet weak var njnnmView: UIView!
    @IBOutlet weak var Botem: UIButton!
    @IBOutlet weak var TextView: UITextView!
    var StringBlock:syntonyStringBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
        self.width = WIDTH
        self.height = HEIGHT
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
               NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
                  
        DispatchQueue.main.async {
            self.Botem.layoutIfNeeded()
        }
    }
    @objc
    private func keyboardWillShow(_ notification: Notification) {
            if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                let keyboardHeight = keyboardSize.height
                if self.Botem.height < keyboardHeight {
                    self.njnnmView.transform = .init(translationX: 0, y: -keyboardHeight + self.Botem.height)
                    self.niimgView.transform = .init(translationX: 0, y: -keyboardHeight + self.Botem.height)
                }
            }
        }
                
        @objc
    private func keyboardWillHide(_ notification: Notification) {
        self.njnnmView.transform = .identity
        self.niimgView.transform = .identity
        }
                
    @IBAction func ConfiremAction(_ sender: UIButton) {
        self.endEditing(true)
        self.removeFromSuperview()
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

        self.StringBlock?(self.TextView.text)
    }
        
    @IBAction func DeleteBtnAction(_ sender: UIButton) {
        self.endEditing(true)
        self.removeFromSuperview()
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)

    }
        
        
}
