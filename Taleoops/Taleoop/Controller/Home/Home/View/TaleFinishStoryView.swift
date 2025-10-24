
import UIKit

class TaleFinishStoryView: UIView {

    @IBOutlet weak var ImgView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    var model = TaleBeModel(){
        didSet {
            self.ImgView.image = .init(named: model.chevroler ?? "StoryCover1")
            self.ContentLabel.text = model.polarisable
                        
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
