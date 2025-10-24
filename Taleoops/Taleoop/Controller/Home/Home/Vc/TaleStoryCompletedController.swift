
import UIKit

class TaleStoryCompletedController: BaseController {
    @IBOutlet weak var BgView: UIStackView!
    @IBOutlet weak var urIngmView: UIImageView!
        
    @IBOutlet weak var ImgBgView: UIView!
    @IBOutlet weak var MohufView: UIView!
        
    @IBOutlet weak var TitleNameLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
        
    @IBOutlet weak var NumberCount: UILabel!
    internal var model = TaleBeModel()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        DispatchQueue.main.async{
            self.ImgBgView.layoutIfNeeded()
            self.ImgBgView.addLightColor(.Top, [isColors(0xCD873C).withAlphaComponent(0).cgColor,isColors(0xF7BF49).withAlphaComponent(0.7).cgColor])
        }
        let miar = self.BgView.allImageViews()
        var ri : Int = 0
        for img in miar {
            img.isHidden = true
            if img.tag < self.model.unengaged?.count ?? 0{
                img.isHidden = false
                let miauser : TaleGenModel = self.model.unengaged![ri]
                img.sd_setUrlString(miauser.groupware)
                ri += 1
            }
        }
        self.NumberCount.text = "+\(ri)"
        let blurEffectView = UIVisualEffectView(effect: UIBlurEffect(style: .light) )
        DispatchQueue.main.async {
            self.MohufView.layoutIfNeeded()
            blurEffectView.frame = self.MohufView.bounds
        }
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        blurEffectView.alpha = 0.4
        MohufView.addSubview(blurEffectView)
        MohufView.clipsToBounds = true
                
                
        self.urIngmView.image = .init(named: model.chevroler ?? "StoryCover1")
        self.TitleNameLabel.text = model.polarisable
        var mar = [String]()
        for mia in self.model.unengaged ?? []{
            mar.append(mia.comment!)
        }
        let stringNumbers = mar.map { String($0) }.joined(separator: "\n")
        self.ContentLabel.text = stringNumbers
    }
        
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        self.navigationController?.viewControllers.remove(at: 2)
        self.navigationController?.popViewController(animated: true)
                
    }
}
