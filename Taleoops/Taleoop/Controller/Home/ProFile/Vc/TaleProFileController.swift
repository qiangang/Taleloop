
import UIKit
import Kingfisher
import RongIMLibCore
class TaleProFileController: BaseController {
    let arrayIcon = ["MyStoryIcon","MyPostIcon","MyLikeIcon","MyFollowingIcon","FollowersIcon","BlocklistIcon","MyPrivacyIcon","MyTermsIcon","MyAboutUsIcon","MyClearCacheIcon","MyLogOutICon","MyDeleteIcon"]
    let arrayStr = ["My story","My post","My like","Following","Followers","Blocklist","Privacy","Terms","About us","Clear cache","Log out","Delete"]
    @IBOutlet weak var BtmHeight: NSLayoutConstraint!
        
        
    @IBOutlet weak var ConllectionLayou: WaterfallMutiSectionFlowLayout! {
        didSet{
            self.ConllectionLayou.delegate = self
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleTaleProFileCell.self])
            self.CollectionsView.register(UINib.init(nibName: "TaleProFileHeaderColl", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "TaleProFileHeaderColl")
            self.CollectionsView.register(UINib(nibName: "TaleWaterFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: "TaleWaterFooterView")
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.IsNaviBool = true
                
        self.BtmHeight.constant = HeightBottom
                
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.CollectionsView.reloadData()
    }
}

extension TaleProFileController: UICollectionViewDelegate, UICollectionViewDataSource {
        
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.arrayStr.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleTaleProFileCell.self, for: indexPath)
        cell.ImgView.image = .init(named: self.arrayIcon[indexPath.item])
        cell.NameLabel.text = self.arrayStr[indexPath.item]
        cell.AccountLab.isHidden = true
        if indexPath.item == 11 {
            cell.AccountLab.isHidden = false
        }
        return cell
    }
        
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TaleProFileHeaderColl", for: indexPath) as! TaleProFileHeaderColl
            header.model = TaleUserData.shared.data
            return header
        } else  if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "TaleWaterFooterView", for: indexPath) as! TaleWaterFooterView
                        
            return footer
        }
        return UICollectionReusableView()
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch indexPath.item {
        case 0:
            let vc = TaleMyStoryController()
            vc.UserID = TaleUserData.shared.data.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = TalemyPostController()
            vc.UserID = TaleUserData.shared.data.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = TaleMyLikeController()
            vc.UserID = TaleUserData.shared.data.chylomicron
            self.navigationController?.pushViewController(vc, animated: true)
        case 3:
            let vc = TaleFollowController()
            vc.selectIndex = 1
            self.navigationController?.pushViewController(vc, animated: true)
        case 4:
            let vc = TaleFollowController()
            vc.selectIndex = 2
            self.navigationController?.pushViewController(vc, animated: true)
        case 5:
            let vc = TaleFollowController()
            vc.selectIndex = 3
            self.navigationController?.pushViewController(vc, animated: true)
        case 6:
            let vc = TaleTaleWebController()
            vc.WebTitleName = "Privacy Policy"
            vc.ContentUrl = POLICYURL
            self.navigationController?.pushViewController(vc, animated: true)
        case 7:
            let vc = TaleTaleWebController()
            vc.WebTitleName = "Terms of Service"
            vc.ContentUrl = SERVICEURL
            self.navigationController?.pushViewController(vc, animated: true)
        case 8:
            let vc = TaleAboutUsController()
            self.navigationController?.pushViewController(vc, animated: true)
        case 9:
            DispatchQueue.main.async {
                ProgressHUD.shared.showInfo(in: Windows, text: "Cleaning up...")
            }
            DispatchQueue.global().async {
                sleep(3)
                DispatchQueue.main.async {
                    HideLoad()
                }
            }
                        
        case 10:
            let logoutView = TaleExitDeleteView.initNibName()
            Windows.addSubview(logoutView)
            logoutView.syntonyCall = {[weak self] in
                ShowLoad()
                GetStandardBlock { armonica, success in
                    HideLoad()
                    if success {
                        logoutView.removeFromSuperview()
                        ClearOutAll()
                        RCCoreClient.shared().logout()
                        AppDelegas.UserLogin()
                    }
                }
            }
        case 11:
            let logoutView = TaleExitDeleteView.initNibName()
            logoutView.TopIcon.image = .init(named: "LdteIcon")
            logoutView.TitleNameLabel.text = "Delete  Account"
            logoutView.ContentLabel.text = "Deleting the account will clear the account data. Are you sure to delete?"
            Windows.addSubview(logoutView)
            logoutView.syntonyCall = {[weak self] in
                ShowLoad()
                GetOfficialBlock { armonica, success in
                    HideLoad()
                    if success {
                        logoutView.removeFromSuperview()
                        ClearOutAll()
                        RCCoreClient.shared().logout()
                        AppDelegas.UserLogin()
                    }
                }
            }
        default:
            break
        }
    }
}









extension TaleProFileController: WaterfallMutiSectionDelegate {
        
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        if indexPath.item == 11 {
            return 96
        }
        return 76
    }
        
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 4
    }
        
    func referenceSizeForHeader(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
        return CGSize(width: WIDTH, height: 197 + StatusBarHei)
    }
        
    func referenceSizeForFooter(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGSize {
        return CGSize(width: WIDTH, height: 0)
    }
        
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
    }
        
        
        
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 10
    }
        
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 10
    }
        
    func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 15
    }
        
}


