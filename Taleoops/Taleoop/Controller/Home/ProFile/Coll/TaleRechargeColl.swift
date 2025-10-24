
import UIKit

class TaleRechargeColl: UICollectionViewCell {
    @IBOutlet weak var nomadicLabel: UILabel!
    @IBOutlet weak var maeliteLabel: UIButton!
        
    var model = TaleCommoditiesListModel(){
        didSet {
            self.nomadicLabel.text = "\(model.nomadic)"
            self.maeliteLabel.setTitle(String.localeNum(model.ishmaelite), for: .normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
