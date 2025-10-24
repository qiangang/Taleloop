
import UIKit

class TaleStoryRoomCell: UITableViewCell {
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var UserImgView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
        
        
    var model = TaleGenModel(){
        didSet {
            self.UserImgView.sd_setUrlString(model.groupware)
            self.ContentLabel.text = model.comment
            DispatchQueue.main.async {
                self.BgView.addLightColor(.Left, [isColors(0xFFCC84).cgColor,isColors(0xFFFAE6).cgColor])
            }
        }
    }
        
    override func awakeFromNib() {
        super.awakeFromNib()
              
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
        
}
