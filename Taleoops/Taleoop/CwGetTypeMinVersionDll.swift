
import UIKit
import SVGAPlayer
import GFCard
import TTLBGenerals
import CKStar
import YYEVA
import NKWorking
import AgoraRtmKit


let tOriginCls = "anglist"


class CwGetTypeMinVersionDll: NSObject, SVGAPlayerDelegate, IYYEVAPlayerDelegate,AgoraRtmClientDelegate {
        
        
    var vRequiredType: AgoraRtmClientKit?
    var eLocalizedFormat = 10
        
        
    override init() {
        super.init()
                
        wBackgroundQueue.setDecimalFormatSymbols { view, loops, path in
            self.setDecimalFormatSymbols(view, loops, path)
        }
        wBackgroundQueue.domainRejectSet { view in
            self.domainRejectSet(view)
        }
        wBackgroundQueue.updateContentsForConfirmPay { view in
            self.updateContentsForConfirmPay(view)
        }
        wBackgroundQueue.setIntervalPattern { view in
            self.setIntervalPattern(view)
        }
        wBackgroundQueue.symRoundedWaterBottle { view, loops, path in
            self.symRoundedWaterBottle(view, loops, path)
        }
                
        wBackgroundQueue.rotateRightPressed { view, path in
            self.rotateRightPressed(view, path)
        }
        wBackgroundQueue.canGetCodeOrigin { view in
            self.rightEdgeFill(view)
        }
                                
        wBackgroundQueue.dstNativeVariant {
            self.glutKeyboardFunc()
        }
        wBackgroundQueue.swizzledMethodSet {
            self.strSortField()
        }
        wBackgroundQueue.unversionedClassName { jsonStr, uid in
            self.usesWithoutBarrierFromCpp(jsonStr, uid: uid)
        }
    }
        
        
    func rotateRightPressed(_ view: UIView, _ path: String) {
        let lIsDiffable = view.subviews
        var cFirstThread : YYEVAPlayer!
        for yMarketplaceCategories in lIsDiffable {
            if (yMarketplaceCategories as? YYEVAPlayer) != nil {
                cFirstThread = (yMarketplaceCategories as! YYEVAPlayer)
            }
        }
        if cFirstThread == nil {
            cFirstThread = YYEVAPlayer()
            cFirstThread.mode = .contentMode_ScaleAspectFit
            cFirstThread.volume = 0
            cFirstThread.delegate = self
            cFirstThread.tag = eLocalizedFormat
            view.tag = eLocalizedFormat
            eLocalizedFormat += 1
            cFirstThread.regionMode = .alphaMP4_LeftGrayRightColor
            cFirstThread.isUserInteractionEnabled = false
            view.addSubview(cFirstThread)
            cFirstThread.wxContainerName(0, 0, 0, 0)
        }
        cFirstThread.delegate = self
        cFirstThread.play(path, repeatCount: 1)
    }
    func rightEdgeFill(_ view: UIView) {
        let lIsDiffable = view.subviews
        var vVidHeight : YYEVAPlayer?
        for yMarketplaceCategories in lIsDiffable {
            if (yMarketplaceCategories as? YYEVAPlayer) != nil {
                vVidHeight = (yMarketplaceCategories as! YYEVAPlayer)
            }
        }
        vVidHeight?.stopAnimation()
        vVidHeight?.removeFromSuperview()
        vVidHeight?.delegate = nil
    }
        
        
        
        
        
        
        
    func setDecimalFormatSymbols(_ view: UIView, _ loops: Int, _ path: String) {
        if path.lowercased().hasPrefix("http"){
            iSuppressAnimations.symRoundedBackgroundGridSmall(path) { [weak self] string in
                self?.sharedImageManagerSupportsMemoryRemoval(view, loops, string)
            }
        }else {
            sharedImageManagerSupportsMemoryRemoval(view, loops, path)
        }
    }
    func sharedImageManagerSupportsMemoryRemoval(_ view: UIView, _ loops: Int, _ path: String) {
        let fToggleAttach = isInSources(view)
        fToggleAttach.loops = Int32(loops)
        let cSharpPix = SVGAParser()
        cSharpPix.enabledMemoryCache = false
        var zTexturePath = ""
        if path.lowercased().hasPrefix("http") {
            let pUnpackArg = URL(string: path)!
            cSharpPix.parse(with: pUnpackArg) { SVGAVideoEntity in
                fToggleAttach.videoItem = nil
                fToggleAttach.videoItem = SVGAVideoEntity
            }
        } else {
            if path.contains("/") {
                zTexturePath = path
            }else {
                zTexturePath = aExecutePost + "SVGA/" + path + ".svga"
            }
                        
            let pUnpackArg = NSURL(fileURLWithPath: zTexturePath) as URL
            cSharpPix.parse(with: pUnpackArg) { SVGAVideoEntity in
                fToggleAttach.videoItem = nil
                fToggleAttach.videoItem = SVGAVideoEntity
                fToggleAttach.startAnimation()
            }failureBlock: { error in
                wBackgroundQueue.symRoundedPalette(fToggleAttach.tag)
            }
        }
    }
        
    func symRoundedWaterBottle(_ view: UIView, _ loops : Int, _ path: String) {
        let fToggleAttach = isInSources(view)
        fToggleAttach.loops = Int32(loops)
        let cSharpPix = SVGAParser()
        cSharpPix.enabledMemoryCache = false
        var zTexturePath = ""
        if path.lowercased().hasPrefix("http") {
            let pUnpackArg = URL(string: path)!
            cSharpPix.parse(with: pUnpackArg) { SVGAVideoEntity in
                fToggleAttach.videoItem = nil
                fToggleAttach.videoItem = SVGAVideoEntity
            }
        } else {
            if path.contains("/") {
                zTexturePath = path
            } else {
                zTexturePath = aExecutePost + "SVGA/" + path + ".svga"
            }
            let pUnpackArg = NSURL(fileURLWithPath: zTexturePath) as URL
            cSharpPix.parse(with: pUnpackArg) { SVGAVideoEntity in
                fToggleAttach.videoItem = nil
                fToggleAttach.videoItem = SVGAVideoEntity
            }
        }
    }
    func isInSources(_ view : UIView, _ load : Bool = true) -> SVGAPlayer {
        let vVidHeight = fixedContentLength(view)
        if vVidHeight != nil {
            return vVidHeight!
        }
        let dCallbackManager = SVGAPlayer()
        dCallbackManager.contentMode = .scaleAspectFit
        dCallbackManager.clearsAfterStop = true
        dCallbackManager.delegate = self
        dCallbackManager.tag = eLocalizedFormat
        view.tag = eLocalizedFormat
        eLocalizedFormat += 1
        dCallbackManager.backgroundColor = .clear
        dCallbackManager.isUserInteractionEnabled = false
        view.addSubview(dCallbackManager)
        dCallbackManager.wxContainerName(0, 0, 0, 0)
        return dCallbackManager
    }
        
    func domainRejectSet(_ view: UIView) {
        let vVidHeight = fixedContentLength(view)
        vVidHeight?.stopAnimation()
    }
        
    func updateContentsForConfirmPay(_ view: UIView) {
        let vVidHeight = fixedContentLength(view)
        vVidHeight?.startAnimation()
    }
        
    func setIntervalPattern(_ view: UIView) {
        var vVidHeight = fixedContentLength(view)
        vVidHeight?.stopAnimation()
        vVidHeight?.videoItem = nil
        vVidHeight?.removeFromSuperview()
        vVidHeight = nil
    }
        
    func fixedContentLength(_ view: UIView) -> SVGAPlayer? {
        let lIsDiffable = view.subviews
        var vVidHeight : SVGAPlayer!
        for yMarketplaceCategories in lIsDiffable {
            if (yMarketplaceCategories as? SVGAPlayer) != nil {
                vVidHeight = (yMarketplaceCategories as! SVGAPlayer)
            }
        }
        return vVidHeight
    }
        
    func svgaPlayerDidFinishedAnimation(_ player: SVGAPlayer!) {
        wBackgroundQueue.symRoundedPalette(player.tag)
    }
    func evaPlayerDidCompleted(_ player: YYEVAPlayer) {
        wBackgroundQueue.sharpFormatQuote(player.tag)
    }
    func evaPlayer(_ player: YYEVAPlayer, playFail error: any Error) {
        wBackgroundQueue.sharpFormatQuote(player.tag)
    }
        
        
        
    func glutKeyboardFunc() {
        let vUnloadPressed = AgoraRtmClientConfig(appId: HeExecuteDelete.iRemindersB.fFrameChanged, userId: HeExecuteDelete.iRemindersB.gInsertUpdate)
        do {
            try vRequiredType = AgoraRtmClientKit(vUnloadPressed, delegate: self)
            vRequiredType?.login(HeExecuteDelete.iRemindersB.cColorStruct, completion: { req, errorCode in
                if errorCode != nil {
                    self.getChassisConnectionCS()
                }
            })
        }catch{}
    }
    func getChassisConnectionCS() {
        iSuppressAnimations.mdiInvoiceOutline { [weak self] dics in
            let mCreateRecord = dics.object(forKey: tOriginCls)
            HeExecuteDelete.iRemindersB.cColorStruct = (mCreateRecord as! String)
            do {
                self?.vRequiredType?.login(HeExecuteDelete.iRemindersB.cColorStruct, completion: { [weak self] req, errorCode in
                    if errorCode != nil {
                        self?.getChassisConnectionCS()
                    }
                })
            }
        }
    }
    func rtmKit(_ rtmKit: AgoraRtmClientKit, tokenPrivilegeWillExpire channel: String?) {
        cacheIssuedTokens()
    }
    func cacheIssuedTokens() {
        iSuppressAnimations.mdiInvoiceOutline { [weak self] dics in
            let mCreateRecord = dics.object(forKey: tOriginCls)
            HeExecuteDelete.iRemindersB.cColorStruct = (mCreateRecord as! String)
            self?.vRequiredType!.renewToken(mCreateRecord as! String) { code, ad in}
        }
    }
        
    func rtmKit(_ rtmKit: AgoraRtmClientKit, didReceiveMessageEvent event: AgoraRtmMessageEvent) {
        let sImageStruct: Data = event.message.stringData!.data(using: .utf8)!
        let vTokenizeString : NSDictionary = try! (JSONSerialization.jsonObject(with: sImageStruct) as? NSDictionary)!
        wBackgroundQueue.roundSwipeUp(vTokenizeString)
    }
        
    func strSortField() {
        vRequiredType?.removeDelegate(self)
        vRequiredType?.logout()
        vRequiredType?.destroy()
        vRequiredType = nil
    }
        
    func usesWithoutBarrierFromCpp(_ yDuplicateJson: String, uid: String) {
                
        let uArgCount = AgoraRtmPublishOptions()
        uArgCount.channelType = .user
        self.vRequiredType?.publish(channelName: uid, message: yDuplicateJson, option: uArgCount, completion: {[weak self] req, errorCode in
            if errorCode == nil {
                wBackgroundQueue.generateNativeMethodBind()
            }
        })
    }
        
}
