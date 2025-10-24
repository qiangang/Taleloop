//
//  TaleChart.swift
//  Taleoop
//
//  Created by Ben on 30/5/2025.
//

import Foundation
import RongIMLibCore


internal func SendMsgTextObj(_ targetId:String,_ content:String, _ callBack :@escaping()->()){
    DispatchQueue.main.async {
        HideLoad()
    }
//    RCIMClient.shared().sendMessage(.ConversationType_PRIVATE,
//                                    targetId: uerId,
//                                    content: RCTextMessage(content: content),
//                                    pushContent: nil, pushData: nil) { successMessage in
//        DispatchQueue.main.async {
//            HideLoad()
//        }
//    } error: { nErrorCode, errorMessage in
//        DispatchQueue.main.async {
//            HideLoad()
//        }
//    }
    RCCoreClient.shared().sendMessage(.ConversationType_PRIVATE, targetId: targetId, content: RCTextMessage(content: content), pushContent: nil, pushData: nil) { msg in
        DispatchQueue.main.async {
            HideLoad()
        }
        callBack()
    } success: { errorMsg in
        DispatchQueue.main.async {
            HideLoad()
        }
    }

}

internal func SendMsgImageObj(_ uerId:String,_ img:UIImage , _ callBack :@escaping()->()){
    DispatchQueue.main.async {
        ShowLoad()
    }
    let msg:RCMessage = RCMessage.init(type: .ConversationType_PRIVATE, targetId: uerId, direction: .MessageDirection_SEND, content: RCImageMessage(image: img))
    RCCoreClient.shared().sendMediaMessage(msg, pushContent: nil, pushData: nil) { d in
        
    } progress: { progress, progressMessage in
    } successBlock: { successMessage in
        DispatchQueue.main.async {
            HideLoad()
        }
        callBack()
    } errorBlock: { nErrorCode, errorMessage in
        DispatchQueue.main.async {
            HideLoad()
        }
    }

}
