
import UIKit
import NKWorking
import TTLBGenerals
import CKStar
import RongIMLibCore

class CwContactFieldType: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let yUsingColor = UIImageView()
        yUsingColor.frame = CGRectMake(0, 0, aFullIntersection, aFullIntersection/375.0*102)
        yUsingColor.backgroundColor = .clear
        yUsingColor.image = UIImage(named: "ccount_insets_ssemath")
        yUsingColor.contentMode = .scaleToFill
        view.addSubview(yUsingColor)
                                
                
        let kFontFile = UIImageView()
        kFontFile.frame = CGRectMake(aFullIntersection/2-50, aFullIntersection/375.0*102 + 75, 100, 100)
        kFontFile.backgroundColor = .clear
        kFontFile.image = UIImage(named: "APPAppIcon")
        kFontFile.contentMode = .scaleAspectFill
        view.addSubview(kFontFile)
                
        self.view.backgroundColor = showAllEditors("FFFAE6")
    }
        
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
                
        iSuppressAnimations.displayNameEncoding([:]) { [weak self] dics in
            guard let self = self else {return}
            if dics.allKeys.count == 0 {
                self.UserLogin()
            }else {
                HeExecuteDelete.iRemindersB.vRawColors = dics.setTimeInSeconds(bRoundFunctions)
                UserTabbarHome()
            }
        } _: { [weak self] in
            self?.UserLogin()
        }
    }
    @objc func UserLogin(){
        hMacPlatform.rootViewController = TaleLoginController()
    }
        
        
        
    var navi : HeSecureConversation!
        
    func startThroughputCalculation(_ dic : NSDictionary) {
        if HeExecuteDelete.iRemindersB.mCreateRecord.count > 0 {
            UserDefaults.standard.set(dic.linkedObjectId(), forKey: "waelchi_hasfocus_bufferlen")
            UserTabbarHome()
        }else {
            UserLogin()
        }
    }
    internal func UserTabbarHome(){
        _ = isLogin()
                
        if TaleUserData.shared.data.yamal == nil {
            self.UserLogin()
            return
        }
        RCCoreClient.shared().initWithAppKey(TaleUserData.shared.data.yamal!, option: nil)
        RCCoreClient.shared().connect(withToken: TaleUserData.shared.data.vs!, timeLimit: 5) { code in
        } success: { status in
            HeLoadPaletted.localAccountIdentifiers()
            HeExecuteDelete.iRemindersB.bEndDistance = true

            let userInfo = RCUserInfo(userId: "\(TaleUserData.shared.data.chylomicron)", name: TaleUserData.shared.data.dioestrous, portrait: TaleUserData.shared.data.groupware)
            RCCoreClient.shared().currentUserInfo = userInfo
        } error: { code in
            HeExecuteDelete.iRemindersB.bEndDistance = false
        }
            
        if !FileManager().fileExists(atPath: NSHomeDirectory().appending("/Library/Caches/") + URL(string: DownloadICONSURL as String)!.lastPathComponent) {
            let vc  = DownloadController()
            let navi = BaseNavController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            selfs.present(navi, animated: false)
        } else {
            AppDelegas.UserTabbarHome()
        
            let vc = TaleTabBarController()
            navi = HeSecureConversation(rootViewController: vc)
            navi.setNavigationBarHidden(true, animated: true)
            hMacPlatform.rootViewController = navi
        }
        objectToCopy(#selector(vectorYSetup), "asdsada")
    }
    @objc func vectorYSetup() {
        navi?.setNavigationBarHidden(true, animated: true)
    }
}

