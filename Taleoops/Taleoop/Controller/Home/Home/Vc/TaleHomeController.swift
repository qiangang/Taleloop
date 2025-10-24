
import UIKit
import IMRoom
import TTLBGenerals
import NKWorking
import CKStar
import GFCard
import TTLBGenerals

class TaleHomeController: BaseController {
    @IBOutlet weak var nareUrl: UIImageView!
    private var arrayAll = [TaleBeModel]()
    @IBOutlet weak var HubImag: UIImageView!
    @IBOutlet weak var BgView: UIView!
    @IBOutlet weak var BtomHeight: NSLayoutConstraint!
        
    @IBOutlet weak var CollectionView: UICollectionView!{
        didSet {
            self.CollectionView.AddRegisterCell([TaleHomeColl.self])
        }
    }
    @IBOutlet weak var LayouHeight: UICollectionViewFlowLayout!{
        didSet {
            LayouHeight.minimumLineSpacing = 8
            LayouHeight.minimumInteritemSpacing = 8
            LayouHeight.sectionInset = .init(top: 0, left: 0, bottom: SCALEH(20.0), right: 20)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.BtomHeight.constant = HeightBottom + SCALEH(25.0)
                
        self.BgView.layoutIfNeeded()
        DispatchQueue.main.async {
            self.LayouHeight.itemSize = .init(width: WIDTH - 108, height: self.BgView.height - SCALEH(20.0))
        }
                
                
        let dic = [
            "id": TaleUserData.shared.data.chylomicron, 
            "user_no": TaleUserData.shared.data.uncus, 
            "phone": "", 
            "email": "", 
            "avatar": TaleUserData.shared.data.groupware as Any, 
            "nickname": TaleUserData.shared.data.dioestrous as Any, 
            "gender": TaleUserData.shared.data.passiontide, 
            "birthday": "", 
            "login_type": 7, 
            "is_register": false, 
            "token": TaleUserData.shared.data.koa as Any, 
            "im_token": TaleUserData.shared.data.vs as Any, 
            "rtm_token": TaleUserData.shared.data.anglist as Any, 
            "vip":TaleUserData.shared.data.piston,
            "intro":TaleUserData.shared.data.waterspout as Any,
            "is_staff":TaleUserData.shared.data.radially,
            "rong_cloud_app_key":TaleUserData.shared.data.yamal as Any,
            "agora_app_id":TaleUserData.shared.data.utah as Any,
        ]
                
                
        HeExecuteDelete.iRemindersB.minBubbleWidth(dic as NSDictionary)
        NotificationCenter.default.post(name: NSNotification.Name.init(rawValue: "galicia_starta"), object: "")
                
        let vTokenizeString = [
            "jHiddenInput" : publicsKey,
            "xOffAnimation" : fingerprint,
            "eLikeStrings" : signKey,
            "tSizeMap" : BASEURL,
            "oRenderMarker" : bundlesIdentifier,
            "wStatus" : appName,
            "qGetPublisher" : UIDevice.current.systemVersion,
        ] as! NSDictionary
        iSuppressAnimations.itemWithTitle(vTokenizeString)
                
                
                
                
                
        HeLoadPaletted.glContextOwned()
                
        iSuppressAnimations.bottomRightCorner()
        HeExecuteDelete.iRemindersB.createFullScreenQuad()
                
  
        NotificationCenter.default.addObserver(self, selector: #selector(fgSystemDefaultCenturyYear(_:)), name: Notification.Name("siif_nst"), object: nil) 
        NotificationCenter.default.addObserver(self, selector: #selector(symSharpModeDual(_:)), name: Notification.Name("consonants_voltar"), object: nil)
                
        NotificationCenter.default.addObserver(self, selector: #selector(originalErrorHandler(_:)), name: Notification.Name("mawnde_emacr_motionstate"), object: nil)

    }
    @objc func originalErrorHandler(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        GetHydrogenPartBlock(userInfo!) { armonica , success in
        }
    }
    @objc private func fgSystemDefaultCenturyYear(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String : Any]
        let tailgunning =  userInfo?["tailgunning"]
        let polarisable =  userInfo?["polarisable"]
        let autoland =  userInfo?["autoland"]
        let stretcher =  userInfo?["stretcher"]
                
        let ary = [
            "tailgunning":tailgunning!,
            "polarisable":polarisable!,
            "trilobal":autoland!,
            "desalinization":stretcher!,
        ] as [String : Any]
        GetFrogBlock(ary) { armonica , success in
                        
        }
    }
    @objc private func symSharpModeDual(_ notification: Notification) {
        let userInfo = notification.userInfo as? [String: Any]
        print("11")
        if let userInfo = notification.userInfo as? [String: Any], let value = userInfo["userId"] {
            print("Received notification with value: \(value)")
            GetDefinitionBlock(["tailgunning":value]) { armonica , success in
                if success {
                     NotificationCenter.default.post(name: Notification.Name("jalr_joplini"), object: nil, userInfo: armonica)
                }
            }
        }
    }
    @IBAction private func LibraryBtnAction(_ sender: UIButton) {
        let vc = TaleStoryLibraryController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func StoryHubBtnAction(_ sender: UIButton) {
        zDependsOn.mdiSyncOff()
        let vc =  HeMouseButtons.sharedImageProcessingContext()
        self.navigationController?.present(vc, animated: true)
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestLibrCall()
    }
    private func requestLibrCall(){
        if self.arrayAll.count == 0 {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":"StoryLibraryStr","copilot":1]) { armonica, success in
            HideLoad()
            if success {
                self.arrayAll.removeAll()
                let ardol = TaleBeListModel(armonica)
                for mdl in ardol.armonica ?? [] {
                    if mdl.unengaged?.count == mdl.desalinization {
                        self.arrayAll.append(mdl)
                    }
                }
                                
                let sorted = self.arrayAll.sorted { oneModel, twoModel in
                    if oneModel.avow?.count ?? 0 > twoModel.avow?.count ?? 0 {
                        return true
                    }else{
                        return false
                    }
                }
                self.arrayAll = sorted
                                
                self.BgView.layoutIfNeeded()
                DispatchQueue.main.async {
                    self.LayouHeight.itemSize = .init(width: WIDTH - 108, height: self.BgView.height - SCALEH(20.0))
                }
                self.CollectionView.reloadData()
            }
        }
    }
}


extension TaleHomeController : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayAll.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleHomeColl.self, for: indexPath)
                
        coll.model = self.arrayAll[indexPath.item]
                
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                
        let mdl = self.arrayAll[indexPath.item]
        if mdl.unengaged?.count == mdl.desalinization {
                        
            let vc = TaleFinishStoryController()
            vc.model = mdl
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = TaleStoryProgressController()
            vc.model = mdl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
