
import UIKit
import IQKeyboardManagerSwift
import RongIMLibCore
import SSZipArchive
import Bugly
import CKStar
import TTLBGenerals
import NKWorking
import SDWebImage
import PinkLoop
import GFCard
import FBSDKCoreKit
import AdjustSdk
import AnchorStar
//import FirebaseAuth
//import Firebase

@main
class AppDelegate: UIResponder, UIApplicationDelegate,UNUserNotificationCenterDelegate {

    var window: UIWindow?
        
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        self.window = UIWindow(frame: UIScreen.main.bounds)

        moveReactContextToCurrentLifecycleState()
        SDImageCache.shared.config.maxMemoryCost = 1024 * 1024 * 400
        SDImageCache.shared.config.maxMemoryCount = 200
        _ = CwGetTypeMinVersionDll()
        hMacPlatform = self.window
        HeLoadPaletted.glContextOwned()
                  
              
                
                
        didTransitionFromView(application, launchOptions)
         RsWebBrowserCompleteAuthSessionResult.mdiOneUp()
         zDependsOn.mdiSyncOff()
        application.isIdleTimerDisabled = true
                
        objectToCopy(application)
                
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.keyboardDistance = 0
        IQKeyboardManager.shared.resignOnTouchOutside = true
                
        HeExecuteDelete.iRemindersB.createFullScreenQuad()
                
        let pFinalIndices = UINavigationController(rootViewController: CwContactFieldType())
        pFinalIndices.navigationBar.isHidden = true
        hMacPlatform!.rootViewController = pFinalIndices
                
        window!.makeKeyAndVisible()
        NotificationCenter.default.addObserver(self, selector: #selector(UserLogin), name: NSNotification.Name(rawValue: "notni_underspecify"), object: nil)
                
        
        if let options = launchOptions, let notification = options[UIApplication.LaunchOptionsKey.remoteNotification] as? [String: Any] {
            // 处理通过推送启动App的情况
            handlePushNotification(notification)
        }
        
        // 设置代理以处理前台和后台的推送通知
        UNUserNotificationCenter.current().delegate = self
        requestNotificationAuthorization()
        
        
        NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidEnterBackground), name: UIApplication.didEnterBackgroundNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationWillEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
        fackBooks()

        return true
    }
    /// face Book
    func fackBooks() {
          DispatchQueue.main.async {
              AppEvents.shared.loggingOverrideAppID = facebook_serial
              Settings.shared.clientToken = facebook_key
              Settings.shared.isAdvertiserTrackingEnabled = true
              Settings.shared.isAutoLogAppEventsEnabled = true
              AppEvents.shared.logEvent(AppEvents.Name(rawValue: "\(appName)Loading"))
          }
      }
    @objc private func applicationDidEnterBackground() {
        print("周期 ----应用程序进入后台----")
        Isfrontback = true
    }
    
    @objc private func applicationWillEnterForeground() {
        print("周期 ----应用程序进入前台----")
        Isfrontback = false
        
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        // 处理前台接收到的推送通知
//        completionHandler([.alert, .sound, .badge])
    }
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        // 处理用户与推送通知的交互（如点击通知）
//        if let userInfo = response.notification.request.content.userInfo {
//            handlePushNotification(userInfo)
//        }
        completionHandler()
    }
    
    func handlePushNotification(_ userInfo: [AnyHashable: Any]) {
        // 处理推送通知的逻辑，例如更新UI等
        print("Received push notification: \(userInfo)")
    }
    func requestNotificationAuthorization() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
            if granted {
                print("Notification permission granted.")
            } else {
                print("Notification permission denied.")
            }
        }
    }
    @objc func objectToCopy(_ application: UIApplication) {
        let aRegisterForeground = UNUserNotificationCenter.current()
        aRegisterForeground.requestAuthorization(options: [.alert, .badge, .sound]) { (granted, error) in
            if granted {
                aRegisterForeground.getNotificationSettings { (settings) in
                }
            } else {
            }
        }
        application.registerForRemoteNotifications()
    }
    func didTransitionFromView(_ application: UIApplication, _ launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        
//        FirebaseApp.configure()
        
        let mProgressiveIgnored = ADJConfig(appToken: sticstoken, environment: ADJEnvironmentProduction)
        Adjust.initSdk(mProgressiveIgnored)
    }
     
    func moveReactContextToCurrentLifecycleState() {
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
        
        
        PtCreateAutosave.negativeLoop(in: appName,
                                      fDataReturns: EMAILADDRESS,
                                      gSetLoggers: SERVICEURL,
                                      iOriginClss: POLICYURL,
                                      mGetParameterbs: bundlesIdentifier,
                                      mRoundCribs: ADJUST_PlaceOrder,
                                      qScaleFactorss: ADJUST_Succes)

    }
        
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        RCCoreClient.shared().setDeviceTokenData(deviceToken)
    }
        
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return (.portrait)
    }
        
    @objc func UserLogin(){
        self.window?.rootViewController = TaleLoginController()
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
            RCCoreClient.shared().registerMessageType(RsTimeStep.self)
            HeExecuteDelete.iRemindersB.bEndDistance = true

            let userInfo = RCUserInfo(userId: "\(TaleUserData.shared.data.chylomicron)", name: TaleUserData.shared.data.dioestrous, portrait: TaleUserData.shared.data.groupware)
            RCCoreClient.shared().currentUserInfo = userInfo
            
            HeLoadPaletted.localAccountIdentifiers()
            
        } error: { code in
            HeExecuteDelete.iRemindersB.bEndDistance = false
        }
        if !FileManager().fileExists(atPath: NSHomeDirectory().appending("/Library/Caches/") + URL(string: DownloadICONSURL as String)!.lastPathComponent) {
            let vc  = DownloadController()
            let navi = BaseNavController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            selfs.present(navi, animated: false)

        } else {
            let vc = TaleTabBarController()
            let navi = BaseNavController(rootViewController: vc)
            
            navi.setNavigationBarHidden(true, animated: false)
            self.window?.rootViewController = navi
        }
                
    }


}

