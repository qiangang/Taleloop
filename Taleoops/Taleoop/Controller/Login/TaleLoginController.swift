
import UIKit
import ActiveLabel
import MBProgressHUD
import CKStar
import NKWorking
import TTLBGenerals
import AdjustSdk
import RongIMLibCore


import SSZipArchive
import Alamofire
import SDWebImage
class TaleLoginController: HeTraditionalChineseObject {
    @IBOutlet weak var DealBtn: UIButton!
        
    @IBOutlet weak var ProtocolLab: ActiveLabel!
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
                
        let customType = ActiveType.custom(pattern: "\\sPrivacy Policy\\b")
        let customType2 = ActiveType.custom(pattern: "\\sTerms of Service\\b")
        ProtocolLab.enabledTypes.append(customType)
        ProtocolLab.enabledTypes.append(customType2)
         ProtocolLab.customize { label in
            label.customColor[customType] = isColors(0xCD873C)
            label.customSelectedColor[customType] = isColors(0xCD873C)
                        
            label.customColor[customType2] = isColors(0xCD873C)
            label.customSelectedColor[customType2] = isColors(0xCD873C)
                        
            label.handleCustomTap(for: customType) { self.ProtocolClick("Custom type", message: $0) }
            label.handleCustomTap(for: customType2) { self.ProtocolClick("Custom type", message: $0) }
                        
            label.configureLinkAttribute = { (type, attributes, isSelected) in
                var atts = attributes
                switch type {
                case customType:
                    atts[NSAttributedString.Key.font] = UIFont.init(name: "BeVietnam-Bold", size: 12.0)
                case customType2:
                    atts[NSAttributedString.Key.font] = UIFont.init(name: "BeVietnam-Bold", size: 12.0)
                default: ()
                }
                return atts
            }
        }
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fadeToBlack("hooks_vestimentaire_yplj", "")
        fadeToBlack("geolokalizazioa_tepsi", "")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fadeToBlack("candidates_undifined", "")
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    private func ProtocolClick (_ title: String, message: String){
        let vc = TaleTaleWebController()
        vc.WebTitleName = message
        if message == "Privacy Policy" {
            vc.ContentUrl = POLICYURL
        } else {
            vc.ContentUrl = SERVICEURL
        }
        let navi = BaseNavController(rootViewController: vc)
        navi.modalPresentationStyle = .fullScreen
        selfs.present(navi, animated: true)
    }
        
    @IBAction func ChoiceBtnAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        self.DealBtn.isSelected = sender.isSelected
    }
        
    @IBAction func FastLoginBtnAction(_ sender: UIButton) {

                
        if self.DealBtn.isSelected == false {
            let popViews = TaleProtocolView.initNibName()
            self.view.addSubview(popViews)
            popViews.syntonycBlock = {[weak self] in
                guard let self = self else { return }
                self.DealBtn.isSelected = true
                self.goToLogin()
            }
            return
        }
                
        self.goToLogin()
    }
        
        
    private func goToLogin(){
         
        
        
        
        

        ShowLoad()
        GetDistinctionBlock { armonica, success in
                        
            if success {
                let ardel = TaleGenModel(armonica["armonica"]!)
                                
                SaveDataInfo(ardel)
                HeExecuteDelete.iRemindersB.minBubbleWidth(armonica["armonica"] as! NSDictionary)
                                
                if HeExecuteDelete.iRemindersB.gFloatProp == true {
                    let xAnimators = ADJEvent.init(eventToken: adjust_sign)
                    xAnimators?.addCallbackParameter("UserId", value: HeExecuteDelete.iRemindersB.gInsertUpdate)
                    xAnimators?.addCallbackParameter("appid", value: adjust_API)
                    Adjust.trackEvent(xAnimators)
                }
                                
                Adjust.requestAppTrackingAuthorization { status in}
                                
                userAluminium { userModel in
                    HeExecuteDelete.iRemindersB.shiftCountForShift {
                        self.checkViny()
                    }
                }
            }else{
                HideLoad()
            }
        }
    }
    func checkViny(){
        iSuppressAnimations.displayNameEncoding([:]) { [weak self] dics in
            HideLoad()
            guard let self = self else {return}
            if dics.allKeys.count == 0 {
//                AppDelegas.UserTabbarHome()
                self.Downloading()
            }else {
                HeExecuteDelete.iRemindersB.vRawColors = dics.setTimeInSeconds(bRoundFunctions)
//                AppDelegas.UserTabbarHome()
                self.Downloading()

            }
        } _: {
            HideLoad()
//            AppDelegas.UserTabbarHome()
            self.Downloading()
        }
    }
    
    func Downloading(){
        if !FileManager().fileExists(atPath: NSHomeDirectory().appending("/Library/Caches/") + URL(string: DownloadICONSURL as String)!.lastPathComponent) {
            let vc  = DownloadController()
            let navi = BaseNavController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            selfs.present(navi, animated: false)
        } else {
            AppDelegas.UserTabbarHome()
        }
    }
}

