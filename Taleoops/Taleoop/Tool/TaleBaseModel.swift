//
//  TaleBaseModel.swift
//  Taleoop
//
//  Created by Ben on 19/5/2025.
//

import UIKit
@objcMembers
class TaleBaseModel: NSObject {
    
    override init() {
        super.init()
    }
    init(_ dic:Any) {
        super.init()
        if let dict = dic as? [String: Any] {
            if !dict.isEmpty {
                setValuesForKeys(dict)
            }
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
    }
     override func setValue(_ value: Any?, forKey key: String) {
        super.setValue(value, forKey: key)
    }
}
