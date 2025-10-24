
import UIKit

class TaleRechargeController: BaseController {
        
    @IBOutlet weak var Layout: WaterfallMutiSectionFlowLayout!{
        didSet {
            self.Layout.delegate = self
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleRechargeColl.self])
        }
    }
    private var arrayMoneyList = [TaleCommoditiesListModel]()
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var NameNum: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        var transform = CATransform3DIdentity
        let rotationAngle: CGFloat = CGFloat(-21) * CGFloat.pi / 180
        transform = CATransform3DRotate(transform, rotationAngle, 0, 0, 1)
        self.BgView.layer.transform = transform
        self.NameTitle.text = "Recharge"
        self.requestCorrection()
    }
    private func requestCorrection(){
        ShowLoad()
        GetCorrectionBlock { armonica, success in
            HideLoad()
            if success {
                self.arrayMoneyList.removeAll()
                let ardol = TaleCommoditiesModel(armonica["armonica"] as Any)
                self.arrayMoneyList.append(contentsOf: ardol.crabbed ?? [])
                self.CollectionsView.reloadData()
                self.NameNum.text = String.localeNum(ardol.uniovular)
                TaleUserData.shared.data.uniovular = ardol.uniovular
                SaveDataInfo(TaleUserData.shared.data)
            }
        }
    }
}
extension TaleRechargeController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,WaterfallMutiSectionDelegate {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayMoneyList.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleRechargeColl.self, for: indexPath)
        cell.model = self.arrayMoneyList[indexPath.item]
        return cell
    }
        
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return 190
    }
        
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 2
    }
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        .init(top: 40, left: 20, bottom: 0, right: 20)
    }
        
        
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 10
    }
        
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mdl = self.arrayMoneyList[indexPath.item]
        let chylomicronID = String(format: "%@%d", String.infoDictionary("CFBundleIdentifier"),mdl.chylomicron)
        ShowLoad()
        TaleApplePayObject.shared.requestAppleObjPayBlock(chylomicronID) {
            HideLoad()
            self.requestCorrection()
        }
    }
}
