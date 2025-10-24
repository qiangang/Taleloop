
import UIKit
import LKChar
import IMRoom
import CKStar
import AnchorStar
import RongIMLibCore

class TaleTabBarController: UITabBarController {
    let BgNibView = TaleBtomView.initNibName()
        
    internal var TabbarArray = [UIViewController]()
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.tabBar.backgroundImage = UIImage()
        self.tabBar.shadowImage = UIImage()
        self.tabBar.tintColor = isColors(0xEE4000)
        self.tabBar.isHidden = true
        self.delegate = self
                
        self.view.addSubview(BgNibView)
  
        BgNibView.snp.makeConstraints { make in
            make.left.bottom.right.equalTo(0)
            make.height.equalTo(70 + BotmSafetyHeight)
        }
        BgNibView.IdxCall = {[weak self] selelIndex in
            guard let self = self else { return }
            HeExecuteDelete.iRemindersB.hOnConnect = true
            self.selectedIndex = selelIndex - 1
        }
        let study = RsAttachmentTextView.addHistoryItemWithUrl()
        getTabbar(study)
        let message = IoTransitionGroup.addHistoryItemWithUrl()
        getTabbar(message)
        let profile = PtCreateAutosave.offsetVectorSize()
        getTabbar(profile)
        let video = HeMouseButtons.sharedImageProcessingContext()
        getTabbar(video)

        self.viewControllers = self.TabbarArray
        self.view.bringSubviewToFront(self.tabBar)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        _ = CwCreateWaitHandle()
                
        objectToCopy(#selector(minimumGroupingDigits), "galicia_starta")
        objectToCopy(#selector(simpleAttributeMappings), "folha_resw_jeffreyjackson")
        objectToCopy(#selector(minimumGroupingDigits), "andrey_novices_subpic")
        objectToCopy(#selector(minimumGroupingDigits), "dtintrv_giulio_annuleren")
        simpleAttributeMappings()
                
        let appearance = UITabBarAppearance.init()
        appearance.configureWithTransparentBackground()
        appearance.backgroundColor = .clear
        self.tabBar.standardAppearance = appearance
        if #available(iOS 15.0, *) {
            self.tabBar.scrollEdgeAppearance = self.tabBar.standardAppearance
        } else {
        }
    }
        
    @objc private func simpleAttributeMappings() {
        RCChannelClient.sharedChannelManager().getUnreadCount([1,3], levels: [0,-1]) { bTheConstructor in
            let fCaptionView = UserDefaults.standard.integer(forKey: "unicon_kary_zsynchornizowane")
            let qOutlinedList = bTheConstructor
            let num = fCaptionView + Int(qOutlinedList)
            DispatchQueue.main.async {
                self.playInputClick(num)
            }
        } error: { str in
            print("11")
        }

    }
        
    @objc private func minimumGroupingDigits() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            RCChannelClient.sharedChannelManager().getUnreadCount([1,3], levels: [0,-1]) { bTheConstructor in
                let fCaptionView = UserDefaults.standard.integer(forKey: "unicon_kary_zsynchornizowane")
                let qOutlinedList = bTheConstructor
                let num = fCaptionView + Int(qOutlinedList)
                                
                var sTransitionUri:Int = num
                if let loadedModel = self.returnPressedAction() {
                    sTransitionUri += loadedModel.num
                }
                DispatchQueue.main.async {
                    self.playInputClick(sTransitionUri)
                }
            }
        }
    }
        
    func returnPressedAction() -> serviceExtensionFailureKillSwitch? {
        do {
            if let cStrFolder = UserDefaults.standard.data(forKey: HeExecuteDelete.iRemindersB.gInsertUpdate + "peso_increasingly_pacakges") {
                let iShadowOffset = PropertyListDecoder()
                return try iShadowOffset.decode(serviceExtensionFailureKillSwitch.self, from: cStrFolder)
            }
        } catch {
        }
        return nil
    }
        
    func playInputClick(_ num : Int) {
        UIApplication.shared.applicationIconBadgeNumber = num
        if num == 0 {
            BgNibView.unreadView.isHidden = true
        }else {
            BgNibView.unreadView.isHidden = false
            BgNibView.unreadNum.text = String(format: "%d", num)
        }
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let tabBarHeight: CGFloat = HeightBottom
        var newFrame = tabBar.frame
        newFrame.size.height = tabBarHeight
        newFrame.origin.y = view.frame.size.height - tabBarHeight
        tabBar.frame = newFrame
        self.tabBar.layoutIfNeeded()
    }
}
extension TaleTabBarController : UITabBarControllerDelegate {
    private func getTabbar(_ vc:UIViewController){
        self.TabbarArray.append(vc)
    }
    internal func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return true
    }
}
