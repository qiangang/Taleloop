
import Foundation
import Alamofire
import UIKit
var headerDic : HTTPHeaders?


internal func GetDistinctionBlock( _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("nor/distinction", ["texturize":7,"passiontide":1], armonica:armonica)
}
internal func getAluminiumBlock(_ chylomicron:Int , _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("during/aluminium/\(chylomicron)", [:],.get, armonica:armonica)
}

internal func userAluminium( _ userModel :@escaping(_ userModel : TaleGenModel) -> Void){
    getAluminiumBlock(TaleUserData.shared.data.chylomicron) { armonica, success in
        if success {
            let ardol = TaleGenModel(armonica["armonica"] as Any)
            ardol.koa = TaleUserData.shared.data.koa
            ardol.anglist = TaleUserData.shared.data.anglist
            ardol.yamal = TaleUserData.shared.data.yamal
            ardol.grievant = TaleUserData.shared.data.grievant
            ardol.klavern = TaleUserData.shared.data.klavern
            ardol.vs = TaleUserData.shared.data.vs
            ardol.utah = TaleUserData.shared.data.utah
            ardol.piston = TaleUserData.shared.data.piston
            ardol.radially = TaleUserData.shared.data.radially
            SaveDataInfo(ardol)
            userModel(ardol)
        }else{
            HideLoad()
        }
    }
}

internal func GetUpperBlock(_ params : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("assistant/upper", params, armonica:armonica)
}

internal func GetCorrectionBlock( _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("price/correction", [:],.get, armonica:armonica)
}

internal func GetAfricaBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("assign/africa", dic, armonica:armonica)
}

internal func GetOfficialBlock( _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("living/official", [:], armonica:armonica)
}

internal func GetStandardBlock( _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void) {
    GetNetworkBlock("painter/standard", [:], armonica:armonica)
}

internal func GetFrogBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("ski/frog", dic, armonica: armonica)
}

internal func GetDefinitionBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("birth/definition", dic,.get, armonica: armonica)
}

internal func GetHydrogenPartBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("hydrogen/part", dic, armonica: armonica)
}

internal func GetDestructionBlock(_ chylomicronID : Int, _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("true/destruction/\(chylomicronID)", [:],.delete, armonica: armonica)
}

internal func GetArmyBlock(_ chylomicronID : Int, _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("bottom/army/\(chylomicronID)", [:],.get, armonica: armonica)
}

internal func GetSpontaneousBlock(_ userID : Int, _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("thorn/spontaneous", ["frigidarium":userID], armonica: armonica)
}

internal func GetChapterBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("suck/chapter", dic,.get, armonica: armonica)
}

internal func GetSecondBlock(_ dic : [String: Any], _ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("fine/second", dic, armonica: armonica)
}

internal func GetUniteBlock(_ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("seldom/unite", ["foliage":"Taleoop give a reward fee deduction.","ishmaelite":15],.get, armonica: armonica)
}

internal func GetMarriageBlock(_ dic : [String: Any],_ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("inefficient/marriage", dic,.get, armonica: armonica)
}

internal func GetShortcomingBlock(_ dic : [String: Any],_ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("concentrate/shortcoming", dic,.get, armonica: armonica)
}

internal func GetBrowBlock(_ dic : [String: Any],_ armonica :@escaping(_ armonica : [String:Any] , _ success: Bool) -> Void){
    GetNetworkBlock("probably/brow", dic,.get, armonica: armonica)
}

private func GetNetworkBlock(_ url :String,
                             _ params :[String: Any],
                             _ method : HTTPMethod = .post,
                             armonica :@escaping(_ armonica : [String:Any],_ success: Bool) -> Void) {
        
    let requestUrl = BASEURL + url
        
    let header : HTTPHeaders = [
        "brelogue" : TaleBASEUUID.share.uuid,
        "inharmonious" : "ios",
        "newsgirl" : UIDevice.current.systemVersion,
        "dragoness" : bundlesIdentifier,
        "newspeak" : .infoDictionary("CFBundleShortVersionString").replacingOccurrences(of: ".", with: ""),
        "spermary" : .infoDictionary("CFBundleShortVersionString"),
        "unfenced" : "en",
        "woebegone" :  .Talefioritura(),
        "jungle" : appName,
        "prisage" : .TaleponLanguage(),
        "dilated" : .TaletensinVPNStr(),
        "HeaderCodeVersion" : "version74",
        "authorization" : isLogin() ? TaleUserData.shared.data.koa ?? "" : "",
        "Signature-Value" :  method == .get ? getCrypto(params, url) : method == .delete ? deleteCrypto(params as NSDictionary, url) : postCrypto(params as NSDictionary, url),
    ]
    headerDic = header

    AF.request(requestUrl, method: method, parameters: params, headers: header).responseData(completionHandler: { response in
        if let resonse = response.data {
            guard let obj = try? JSONSerialization.jsonObject(with: resonse, options: .mutableContainers)  as? [String: Any] else {
                HideLoad()
                return
            }
            let objModel = NetworkModel(obj)
            if objModel.herpes == 0 {
                armonica(obj,true)
            }else{
                armonica(obj,false)
            }
        }else{
            armonica([:],false)
        }
    })
}
extension String {
    static func infoDictionary(_ Info:String) -> String{
        let info = Bundle.main.infoDictionary
        return info![Info] as! String
    }
    static func Talefioritura() -> String{
        var systemInfo = utsname()
        uname(&systemInfo)
        let machineMirror = Mirror(reflecting: systemInfo.machine)
        let identifier = machineMirror.children.reduce("") { identifier, element in
            guard let value = element.value as? Int8, value != 0 else { return identifier }
            return identifier + String(UnicodeScalar(UInt8(value)))
        }
        guard let modelPath = Bundle.main.path(forResource: "WoebegonePhoto", ofType: "plist"),
              let modelDict = NSDictionary(contentsOfFile: modelPath),
              let modelName = modelDict[identifier] as? String else {
            return "Unknown Model"
        }
        return modelName
    }
    static func TaleponLanguage() -> String{
        let voice: [String] = UserDefaults.standard.object(forKey: "AppleLanguages") as! [String]
        return voice.first!.components(separatedBy: "-").first!
    }
    static func TaletensinVPNStr() -> String{
        let proxySettings = CFNetworkCopySystemProxySettings()
        let Retained = proxySettings!.takeRetainedValue() as NSDictionary
        if Retained.count == 0 {
            return "0"
        }else{
            let keys = Retained["__SCOPED__"] as! NSDictionary
            for key: String in keys.allKeys as! [String] {
                if (key == "tap" || key == "tun" || key == "ppp" || key == "ipsec" || key == "ipsec0") {
                    return "1"
                }
            }
            return "0"
        }
    }
}


class TaleBASEUUID:NSObject {
    @objc var uuid = ""
        
    func UUIDLOCAL() {
        if uuid.count != 0 {
            return
        }
        var uuids = ""
        let pas = "StoryPuzzle" + Bundle.main.bundleIdentifier!
        let acc = "StoryPuzzle" + Bundle.main.bundleIdentifier!
        let local = readPassword(service: pas, account: acc)
        if local != nil {
            uuids = String(data: local!, encoding: String.Encoding(rawValue: NSASCIIStringEncoding)) ?? ""
        }
        if uuids.count > 0 {
            uuid = uuids
        }else{
            let uni = CFUUIDCreate(kCFAllocatorDefault)
            uuid = CFUUIDCreateString(kCFAllocatorDefault, uni) as String
            uuid = uuid.replacingOccurrences(of: "-", with: "")
            let data = uuid.data(using: String.Encoding(rawValue: NSASCIIStringEncoding))
            save(password: data!, service: pas, account: acc)
        }
    }
        
        
    func save(password: Data, service: String, account: String) {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecValueData as String: password as AnyObject
        ]
        SecItemAdd(query as CFDictionary, nil)
    }
        
        
    func readPassword(service: String, account: String) -> Data? {
        let query: [String: AnyObject] = [
            kSecAttrService as String: service as AnyObject,
            kSecAttrAccount as String: account as AnyObject,
            kSecClass as String: kSecClassGenericPassword,
            kSecMatchLimit as String: kSecMatchLimitOne,
            kSecReturnData as String: kCFBooleanTrue
        ]
        var itemCopy: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &itemCopy)
        guard status == errSecSuccess else {
            return nil
        }
        let password = itemCopy
                
        return (password as! Data)
    }
        
        
    override init() {
        super.init()
        UUIDLOCAL()
    }
        
        
    @objc class var share: TaleBASEUUID{
        struct Static {
            static let udidModel : TaleBASEUUID = TaleBASEUUID()
        }
        return Static.udidModel
    }
}





internal func requestWeekAlternativeWithBlock(_ type:Int = 1,_ ary:[Any], res :@escaping(_ res : [String:Any] , _ status: Bool) -> Void) {
        
    GetNetworkUploadBlock(type, "january/verb", .post, ["texturize":"\(type)"], ary, success: res)
        
}

private func GetNetworkUploadBlock(_ type:Int = 1,
                                   _ urlString :String,
                                   _ methods:HTTPMethod = .post,
                                   _ params:[String: Any],
                                   _ array: [Any],
                                   success :@escaping(_ response : [String:Any],_ state : Bool) -> Void){
    let httpUrl = BASEURL + urlString
    let header : HTTPHeaders = [
        "brelogue" : TaleBASEUUID.share.uuid,
        "inharmonious" : "ios",
        "newsgirl" : UIDevice.current.systemVersion,
        "dragoness" : bundlesIdentifier,
        "newspeak" : .infoDictionary("CFBundleShortVersionString").replacingOccurrences(of: ".", with: ""),
        "spermary" : .infoDictionary("CFBundleShortVersionString"),
        "unfenced" : "en",
        "woebegone" :  .Talefioritura(),
        "jungle" : appName,
        "prisage" : .TaleponLanguage(),
        "dilated" : .TaletensinVPNStr(),
        "HeaderCodeVersion" : "version74",
        "authorization" : isLogin() ? TaleUserData.shared.data.koa ?? "" : "",
        "Signature-Value" :  methods == .get ? getCrypto(params, urlString) : methods == .delete ? deleteCrypto(params as NSDictionary, urlString) : postCrypto(params as NSDictionary, urlString),
    ]
    headerDic = header
    AF.upload(multipartFormData: { multipartFormData in
        for(key,_)in params {
            let value = params[key]
            multipartFormData.append(((value as AnyObject).data(using:String.Encoding.utf8.rawValue)!), withName: key)
        }
        switch type {
        case 1:
            let img = array.last as! UIImage
            let imgData = img.jpegData(compressionQuality: 0.1)
            multipartFormData.append(imgData!, withName:"file", fileName: "images.png", mimeType:"image/jpg")
        case 2:
            for videos in array {
                let video = videos as! String
                let urlsd:NSURL = NSURL(fileURLWithPath: video)
                let das: NSData = try! NSData(contentsOf: urlsd as URL)
                multipartFormData.append(das as Data, withName: "file", fileName: "Videos.mp4", mimeType: "video/mp4")
            }
        default:
            break
        }
    }, to: httpUrl ,method:methods ,headers: header).response { encodingResult in
        if let resonse = encodingResult.data {
            guard let obj = try? JSONSerialization.jsonObject(with: resonse, options: .mutableContainers)  as? [String: Any] else{
                return
            }
            if obj["herpes"]! as! Int == 0 {
                success(obj,true)
            }else {
                success(obj,false)
            }
        }else{
            success([:],false)
        }
    }
        
}
func arrayToStr(_ array:[Any])->String{
   if (!JSONSerialization.isValidJSONObject(array)) {
       return ""
   }
   let data : Data! = try? JSONSerialization.data(withJSONObject: array, options: [])
   let str = NSString(data:data, encoding: String.Encoding.utf8.rawValue)
   return str! as String
}
