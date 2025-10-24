
import UIKit

class TaleBtmView: UIView {
    @IBOutlet weak var txtView: UITextView!{
        didSet {
            self.txtView.delegate = self
            self.txtView.tintColor = isColors(0xCD873C)
        }
    }
        
    @IBOutlet weak var TipView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
extension TaleBtmView : UITextViewDelegate {
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.TipView.isHidden = textView.text.count == 0 ? false:true
     }
    internal func textViewDidChange(_ textView: UITextView) {
        self.TipView.isHidden = textView.text.count > 0 ? true:false
     }
        
}
