
import UIKit

class TaleFinishStoryCell: UITableViewCell {
    private var arrayDaShang = [TaleGenModel]()
    var gendel = TaleBeModel(){
        didSet {
            self.arrayDaShang.removeAll()
            self.arrayDaShang.append(contentsOf: gendel.avow ?? [])
        }
    }
    @IBOutlet weak var TimeNameLabel: UILabel!
    @IBOutlet weak var ContentLabel: UILabel!
    @IBOutlet weak var urlImgView: UIImageView!
    @IBOutlet weak var ProgressView: CustomProgressView!
    var model = TaleGenModel(){
        didSet {
            self.ContentLabel.text = model.comment
            self.urlImgView.sd_setUrlString(model.groupware)
        }
    }
    var callBlcok:syntonyBlock?
    var callniaremBlcok:syntonyBlock?
    override func awakeFromNib() {
        super.awakeFromNib()
                
    }
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                
    }
        
    @IBAction func SanBtnAction(_ sender: UIButton) {
        if sender.tag == 1 {
            let dadel = TaleGenModel()
            dadel.chylomicron = TaleUserData.shared.data.chylomicron
            dadel.dioestrous = TaleUserData.shared.data.dioestrous!
            dadel.groupware = TaleUserData.shared.data.groupware!
            dadel.comment = sender.tag == 1 ? "0" : "15"
            self.arrayDaShang.append(dadel)
                        
            var charArray = [Any]()
            for mdl in arrayDaShang {
                let userData  = [
                    "chylomicron": mdl.chylomicron,
                    "dioestrous": mdl.dioestrous as Any,
                    "groupware":mdl.groupware as Any,
                    "comment":mdl.comment as Any
                ]
                charArray.append(userData)
            }
            let ray:[String:String] =  ["avow":ArrayToString(charArray)]
            let dic = [
                "chylomicron":self.gendel.chylomicron,
                "anemometry":arrayJSONObject(ray)
            ] as [String : Any]
            ShowLoad()
            GetHydrogenPartBlock(dic) { armonica , success in
                HideLoad()
                if success{
                        let giftView = TaleGiveAwayView.initNibName()
                        switch sender.tag {
                        case 1:
                            giftView.ImgView.image = .init(named: "FreeflowersIcon")
                        case 2:
                            giftView.ImgView.image = .init(named: "TheCakeIcon")
                        case 3:
                            giftView.ImgView.image = .init(named: "PastryIcon")
                        default:
                            break
                        }
                        Windows.addSubview(giftView)
                        giftView.callBack = {[weak self] in
                            guard let self = self else { return }
                        self.callBlcok?()
                    }
                }
            }
        }else{
            if TaleUserData.shared.data.uniovular > 14.99 {
                let dadel = TaleGenModel()
                dadel.chylomicron = TaleUserData.shared.data.chylomicron
                dadel.dioestrous = TaleUserData.shared.data.dioestrous!
                dadel.groupware = TaleUserData.shared.data.groupware!
                dadel.comment = sender.tag == 1 ? "0" : "15"
                self.arrayDaShang.append(dadel)
                                
                var charArray = [Any]()
                for mdl in arrayDaShang {
                    let userData  = [
                        "chylomicron": mdl.chylomicron,
                        "dioestrous": mdl.dioestrous as Any,
                        "groupware":mdl.groupware as Any,
                        "comment":mdl.comment as Any
                    ]
                    charArray.append(userData)
                }
                let ray:[String:String] =  ["avow":ArrayToString(charArray)]
                let dic = [
                    "chylomicron":self.gendel.chylomicron,
                    "anemometry":arrayJSONObject(ray)
                ] as [String : Any]
                ShowLoad()
                GetHydrogenPartBlock(dic) { armonica , success in
                    HideLoad()
                    if success{
                        let giftView = TaleGiveAwayView.initNibName()
                        switch sender.tag {
                        case 1:
                            giftView.ImgView.image = .init(named: "FreeflowersIcon")
                        case 2:
                            giftView.ImgView.image = .init(named: "TheCakeIcon")
                        case 3:
                            giftView.ImgView.image = .init(named: "PastryIcon")
                        default:
                            break
                        }
                        Windows.addSubview(giftView)
                        giftView.callBack = {[weak self] in
                            guard let self = self else { return }
                            self.callBlcok?()
                        }
                    }
                }
                if sender.tag != 1 {
                    TaleUserData.shared.data.uniovular -= 15
                    SaveDataInfo(TaleUserData.shared.data)
                    GetUniteBlock { armonica , success in
                    }
                }
            }else {
                let deficiencyView = TaleCreateTipsView.initNibName()
                Windows.addSubview(deficiencyView)
            }
        }
    }
        
    @IBAction func MoreBtnAction(_ sender: UIButton) {
        if self.model.chylomicron == TaleUserData.shared.data.chylomicron {
            let removeView = ChapterRemoveView.initNibName()
            Windows.addSubview(removeView)
            removeView.syntonyBlock = {[weak self] in
                guard let self = self else { return }
                self.callniaremBlcok?()
            }
        } else {
            let requeView = BottomBounceView.initNibName()
            requeView.userID = self.model.chylomicron
            Windows.addSubview(requeView)
            requeView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                requeView.popHide()
                self.callniaremBlcok?()
            }
        }
    }
        
        
}
