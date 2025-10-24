//
//  TaleUserData.swift
//  Taleoop
//
//  Created by Ben on 27/5/2025.
//

import Foundation
import MJExtension

class TaleUserData: NSObject {
    static let shared = TaleUserData()
    var data = TaleGenModel()
}

func SaveDataInfo(_ ardol:TaleGenModel){
    TaleUserData.shared.data = ardol
    UserDefaults.standard.set(ardol.mj_JSONObject(), forKey: "SaveUserInformation")

}

func isLogin() -> Bool {
    let save:Bool = (UserDefaults.standard.object(forKey: "SaveUserInformation") != nil)
    if save {
        let dictionary = UserDefaults.standard.object(forKey: "SaveUserInformation") as! NSDictionary
        if dictionary == dictionary{
            TaleUserData.shared.data = TaleGenModel(dictionary)
            return true
        }
        return false
    }
    return false
}

func ClearOutAll(){
    UserDefaults.standard.removeObject(forKey: "SaveUserInformation")
    let userDefaults = UserDefaults.standard
    let dics = userDefaults.dictionaryRepresentation()
    for key in dics {
        userDefaults.removeObject(forKey: key.key)
    }
    userDefaults.synchronize()
}
