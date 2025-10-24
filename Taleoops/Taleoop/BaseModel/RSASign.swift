


import Foundation
import CryptoKit
import CryptoSwift
import Alamofire
import UIKit





func nowTimeStamp() -> Int {
    return Int(Date().timeIntervalSince1970)
}
func postCrypto(_ dic : NSDictionary, _ path : String) -> String {
    let time = nowTimeStamp()
        
    let bodyStr = getBodySign1(dic)
    var bodySign = sha256Encrypt(String(format: "%@&", bodyStr))
        
    if bodyStr.count == 0 {
        bodySign = ""
    }

    let signContent = String(format: "%d\nPOST\n/%@\n%@\n%@", time,path,"",bodySign)
    let value = hmacBase64(key: signKey, message: signContent)

    let key = String(format: "type=0;key=%@;time=%d", base64(signKey), time)
    let data = rsaEncrypt(key)

    let latestValue = "key=" + fingerprint + ";secret=" + data + ";signature=" + value
    return latestValue
}




func deleteCrypto(_ dic : NSDictionary, _ path : String) -> String {
    let time = nowTimeStamp()
        
    let bodyStr = getBodySign1(dic)
    var bodySign = sha256Encrypt(String(format: "%@&", bodyStr))
        
    if bodyStr.count == 0 {
        bodySign = ""
    }

    let signContent = String(format: "%d\nDELETE\n/%@\n%@\n%@", time,path,"",bodySign)
    let value = hmacBase64(key: signKey, message: signContent)

    let key = String(format: "type=0;key=%@;time=%d", base64(signKey), time)
    let data = rsaEncrypt(key)

    let latestValue = "key=" + fingerprint + ";secret=" + data + ";signature=" + value
    return latestValue
}





func getCrypto(_ dic : [String: Any], _ path : String) -> String {
    let paths = path
    let time = nowTimeStamp()
        
    let signContent = String(format: "%d\nGET\n/%@\n%@\n%@", time,paths,getBodySign(dic as NSDictionary),"")
    let value = hmacBase64(key: signKey, message: signContent)
        
    let key = String(format: "type=0;key=%@;time=%d", base64(signKey), time)
    let data = rsaEncrypt(key)
        
    let latestValue = "key=" + fingerprint + ";secret=" + data + ";signature=" + value
        
    return latestValue
}




func getBodySign(_ dic : NSDictionary) -> String {
    if dic.allKeys.count == 0 {
        return ""
    }
        
    let headerDic : HTTPHeaders = [
        "bookbinding" : TaleBASEUUID.share.uuid,
        "twayblade" : "ios",
        "giglet" : UIDevice.current.systemVersion,
        "inessential" : .infoDictionary("CFBundleIdentifier"),
        "antennary" : .infoDictionary("CFBundleShortVersionString").replacingOccurrences(of: ".", with: ""),
        "cybernetical" : .infoDictionary("CFBundleShortVersionString")
    ]
    let request = AF.request(BASEURL,method: .get,parameters: (dic as! Parameters),headers: headerDic) { requests in}
        
    var range = NSRange(location: 0, length: 0)
    var urls1 = String(format: "%@", (request.convertible.urlRequest?.url?.absoluteString as? CVarArg) ?? "")
    urls1 = urls1.replacingOccurrences(of: BASEURL + "?", with: "")
    return urls1
}

func getBodySign1(_ dic : NSDictionary) -> String {
    var array = dic.allKeys as! Array<String>
    if array.count == 0 {
        return ""
    }
    if array.count == 1 {
        return String(format: "%@=%@", array.first!, dic.allValues.first as! CVarArg)
    }
    var str = ""
    array.sort { (s1, s2) in
        return s1.localizedStandardCompare(s2) == .orderedAscending
    }
    for key in array {
        if str.count == 0 {
            str = String(format: "%@=%@", key, dic[key] as! CVarArg)
        }else {
            str = str + String(format: "&%@=%@", key, dic[key] as! CVarArg)
        }
    }
    return str
}


func base64(_ string: String) -> String {
    guard let data = string.data(using: .utf8) else { return "" }
    return data.base64EncodedString()
}








func rsaEncrypt(_ text: String) -> String {
    do {
        let encrypted = try RSAEncryptor.encrypt(text, withPublicKey: publicsKey)
        return encrypted
    } catch {
        return ""
    }
}



func hmacBase64(key: String, message: String) -> String {
    let signature = CryptoKit.HMAC<SHA256>.authenticationCode(for: Data(message.utf8), using: SymmetricKey(data: Data(key.utf8)))
    let data = Data(signature).base64EncodedString()
    return data
}




func sha256Encrypt(_ input: String) -> String {
    let data = input.data(using: .utf8)
    guard let hash = data?.sha256() else { return "" }
    return hash.compactMap { String(format: "%02x", $0) }.joined()
}


class RSAEncryptor {
    static func encrypt(_ string: String, withPublicKey publicKey: String) throws -> String {
        guard let data = string.data(using: .utf8) else {
            throw RSAError.stringToDataConversionFailed
        }
                
        let key = try preparePublicKey(publicKey)
        let encryptedData = try encrypt(data, with: key)
                
        return encryptedData.base64EncodedString()
    }
        
    private static func preparePublicKey(_ key: String) throws -> SecKey {
        let header = "-----BEGIN PUBLIC KEY-----"
        let footer = "-----END PUBLIC KEY-----"
        var keyString = key.replacingOccurrences(of: header, with: "")
                           .replacingOccurrences(of: footer, with: "")
                           .replacingOccurrences(of: "\n", with: "")
                           .replacingOccurrences(of: "\r", with: "")
                           .replacingOccurrences(of: " ", with: "")
                
        guard let keyData = Data(base64Encoded: keyString) else {
            throw RSAError.invalidBase64String
        }
                
        let attributes: [CFString: Any] = [
            kSecAttrKeyType: kSecAttrKeyTypeRSA,
            kSecAttrKeyClass: kSecAttrKeyClassPublic,
            kSecAttrKeySizeInBits: 2048
        ]
                
        var error: Unmanaged<CFError>?
        guard let secKey = SecKeyCreateWithData(keyData as CFData, attributes as CFDictionary, &error) else {
            throw error?.takeRetainedValue() ?? RSAError.keyCreationFailed
        }
                
        return secKey
    }
        
    private static func encrypt(_ data: Data, with key: SecKey) throws -> Data {
        let algorithm: SecKeyAlgorithm = .rsaEncryptionPKCS1
                
        guard SecKeyIsAlgorithmSupported(key, .encrypt, algorithm) else {
            throw RSAError.algorithmNotSupported
        }
                
        var error: Unmanaged<CFError>?
        guard let encryptedData = SecKeyCreateEncryptedData(key, algorithm, data as CFData, &error) as Data? else {
            throw error?.takeRetainedValue() ?? RSAError.encryptionFailed
        }
                
        return encryptedData
    }
        
    enum RSAError: Error {
        case stringToDataConversionFailed
        case invalidBase64String
        case keyCreationFailed
        case algorithmNotSupported
        case encryptionFailed
                
        var localizedDescription: String {
            switch self {
            case .stringToDataConversionFailed:
                return ""
            case .invalidBase64String:
                return ""
            case .keyCreationFailed:
                return ""
            case .algorithmNotSupported:
                return ""
            case .encryptionFailed:
                return ""
            }
        }
    }
}
