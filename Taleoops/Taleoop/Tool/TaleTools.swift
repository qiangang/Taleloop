//
//  TaleTools.swift
//  Taleoop
//
//  Created by Ben on 16/5/2025.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

//let BASEURL = "https://testapi2.xiaohuang.link/"
//let BASEURL = "https://api2.umumchat.com/"
let BASEURL = "https://entop.tappyound.xyz/"

let bundlesIdentifier = "com.rctua.taleoop"
let appName = "Taleoop"

let fingerprint = "lNwA1fAeufJy0DMj"
let signKey = "usglwjvx4X02RzRUYJ0WZX9yZvKwu6hD"
let publicsKey = """
        -----BEGIN PUBLIC KEY-----
        MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDJTcZuPK5Sv08wuj3n//4v1qip
        sdUYIjYv2d8Cs56NM9DaUEG9XIRDapB9gbVwYiDHOX5i+QT7d5iPS/6D1wCfLQVv
        A5wfOE5uNzBJxCIqpwhBCLGdG+tA4naUhuJ8VVV4HH7IGrL09fuBmqzdfU794L9b
        KfUhqF7MUdtnXhpYYwIDAQAB
        -----END PUBLIC KEY-----
        """
///统计
let sticstoken = "koikmdgii1vk"

/// adjust 注册
let adjust_sign = "kgvsix"
/// adjust api
let adjust_API = "koikmdgiilvk"
/// adjust 下单
let ADJUST_PlaceOrder = "e4hpme"
// adjust 下单成功
let ADJUST_Succes = "bpzypr"

let SERVICEURL = "https://entop.tappyound.xyz/page/taleoop_user_agreement"
let POLICYURL = "https://entop.tappyound.xyz/page/taleoop_privacy_policy"

let EMAILADDRESS = "kangaijun@hkjobegin.shop"


//Face book
let facebook_serial = "732889763103962"
let facebook_key = "098c304e17104c7792a266d898c33b73"

///下载图标地址
let DownloadICONSURL = "https://dba8j48jrea6j.cloudfront.net/202510/17/6e05751d-0faa-4af0-be40-d3b6a2f1cabb.zip"


internal typealias syntonyBlock = () -> Void
internal typealias syntonyIndexBlock = (_ idx:Int) -> Void
internal typealias syntonyStringBlock = (_ index:String) -> Void
internal typealias syntonyModelBlock = (_ model:TaleBeModel) -> Void
internal typealias UserModelBlock = (_ model:TaleGenModel) -> Void




let WIDTH = UIScreen.main.bounds.width
let HEIGHT = UIScreen.main.bounds.height
internal var SCALEH: (CGFloat) -> CGFloat = { hex in
    return CGFloat(hex) * UIScreen.main.bounds.size.height / 812.0
}
typealias IdxCallBack = (_ idx:Int) -> Void

//let AppDelegas = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
let AppDelegas = UIApplication.shared.delegate as! AppDelegate
 

internal var BotmSafetyHeight:CGFloat {
    if #available(iOS 13.0, *) {
        let scene = UIApplication.shared.connectedScenes.first;
        guard let windowScene = scene as? UIWindowScene else {return 0}
        guard let window = windowScene.windows.first else {return 0}
        return window.safeAreaInsets.bottom
    }
    return 0
}

internal var NavigationHeight: CGFloat {
    return UINavigationController.init().navigationBar.frame.size.height
}

internal var StatusBarHei: CGFloat {
    var statusBarHeight: CGFloat = 0
    let scene = UIApplication.shared.connectedScenes.first
    let windowScene = scene as? UIWindowScene
    statusBarHeight = windowScene?.statusBarManager?.statusBarFrame.height ?? 0;
    return statusBarHeight
}


var HeightBottom : CGFloat = ContentSize(TaleBtomView.initNibName()).height


internal func ShowLoad(){
    DispatchQueue.main.async {
        ProgressHUD.shared.showLoad()
    }
}
internal func HideLoad(){
    DispatchQueue.main.async {
        ProgressHUD.shared.hide()
    }
}
internal func isColors(_ cor:NSInteger) ->UIColor {
    return UIColor(red: ((CGFloat)((cor & 0xFF0000) >> 16)) / 255.0, green: ((CGFloat)((cor & 0xFF00) >> 8)) / 255.0, blue: ((CGFloat)(cor & 0xFF)) / 255.0, alpha: 1)
}
extension UIView {
    @IBInspectable internal var cornerRadius: CGFloat {
        get {return layer.cornerRadius}
        set {layer.cornerRadius = newValue}
        
    }
    @IBInspectable var masksToBounds: Bool {
        set {layer.masksToBounds = newValue}
        get {return layer.masksToBounds}
    }
    @IBInspectable var borderWidth: CGFloat {
        set {layer.borderWidth = newValue} get {return layer.borderWidth}
    }
    @IBInspectable var borderColor: UIColor? {
        set {layer.borderColor = newValue?.cgColor}
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
    }
    
    internal var width: CGFloat {
        set {
            var frame: CGRect = self.frame
            frame.size.width = newValue
            self.frame = frame
        }
        get {return self.frame.size.width}
    }
    
    internal var height: CGFloat {
        set {
            var frame: CGRect = self.frame
            frame.size.height = newValue
            self.frame = frame
        }
        get {return self.frame.size.height}
    }
    
    static func initNibName() ->  Self {
        guard let view = UINib(nibName: String(describing: self), bundle: nil).instantiate(withOwner: nil, options: nil).first as? Self else {
            fatalError("\(String(describing: self))")
        }
        return view
    }
}
extension UILabel {
    @IBInspectable
    internal var initName: String {
        set {
            self.font = .init(name: newValue, size: self.font.pointSize)
        }
        get { return self.initName}
    }
}

extension UIButton {
    @IBInspectable
    internal var initName: String {
        set {self.titleLabel?.font = .init(name: newValue, size: self.titleLabel!.font.pointSize)}
        get { return self.initName}
    }
}

internal func ContentSize(_ contView:UIView) -> CGSize {
    contView.layoutIfNeeded()
    contView.layoutSubviews()
    let widthFenceConstraint = NSLayoutConstraint(item: contView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1.0, constant: CGRectGetWidth(contView.frame))
    contView.addConstraint(widthFenceConstraint)
    let fittingSize = contView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
    contView.removeConstraint(widthFenceConstraint)
    return fittingSize
}

extension UIImageView {
    internal func sd_setUrlString(_ url: String!){
        if url == nil {
            return
        }
        self.kf.indicatorType = .activity
        self.kf.setImage(
            with:URL(string: url),
//            placeholder: UIImage(named: IsPlace!),
            options: [
                .processor(RoundCornerImageProcessor(cornerRadius: 0)),
                .scaleFactor(UIScreen.main.scale),
                .cacheOriginalImage
            ])
    }
}
extension UICollectionView {
    internal func AddRegisterCell<T: UICollectionViewCell>(_ arrayCell: [T.Type]){
        for cellReq in arrayCell {
            self.register(UINib(nibName: String(describing: cellReq.self), bundle: nil), forCellWithReuseIdentifier: String(describing: cellReq.self))
        }
        self.backgroundColor = .clear
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
    }
    
    internal func AddDequCell<T: UICollectionViewCell>(_ col: T.Type, for indexPath: IndexPath) -> T {
        let cell = dequeueReusableCell(withReuseIdentifier: String(describing: T.self), for: indexPath) as! T
        cell.backgroundColor = .clear
        return cell
    }
    
    
}
extension UITableView {
    internal func AddRegisterCell<T: UITableViewCell>(_ ary: [T.Type]){
        for clas in ary{
            self.register(UINib(nibName: String(describing: clas.self), bundle: nil), forCellReuseIdentifier: String(describing: clas.self))
        }
        self.separatorStyle = .none
        self.backgroundColor = .clear
        self.contentInsetAdjustmentBehavior = .never
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        if #available(iOS 15.0, *) {
            self.sectionHeaderTopPadding = 0
        }
    }
    
    internal func AddDequCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: String(describing: T.self), for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(String(describing: cellType))")
        }
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        return cell
    }
    
    
    internal func scrollToRow(_ animat:Bool = true){
        DispatchQueue.main.async {
            let lastSectionIndex = self.numberOfSections - 1
            let lastRowIndex = self.numberOfRows(inSection: lastSectionIndex) - 1
            if lastRowIndex >= 0 {
                self.scrollToRow(at: IndexPath(row: lastRowIndex, section: lastSectionIndex), at: .bottom, animated: animat)
            }
        }
    }
}
internal var selfs: UIViewController {
    let vc = Windows.rootViewController//UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController
    return pushtr(vc!)
}
private func pushtr(_ control:UIViewController) -> UIViewController{
    var vcCor:UIViewController
    var VC = control
    if(VC.presentedViewController != nil) {
        VC = control.presentedViewController!
    }
    if control.isKind(of:UITabBarController.classForCoder()) {
        vcCor = pushtr((control as! UITabBarController).selectedViewController!)
    }else if control.isKind(of:UINavigationController.classForCoder()){
        vcCor = pushtr((control as! UINavigationController).visibleViewController!)
    }else{
        vcCor = VC
    }
    return vcCor
}
public func EstablishDicJson(_ name :NSString, datas :@escaping(_ datas : [String:AnyObject],_ state:[Any])->()) {
    if let path = Bundle.main.path(forResource: name as String, ofType: "json") {
        do {
            let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
            if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let person = jsonResult["data"] as? [Any] {
                // do stuff
                datas(jsonResult,person)
            }
        } catch {
            // handle error
        }
    }
}
extension UITextView {
    @IBInspectable var masksInset: Bool {
        set {
            self.textContainer.lineFragmentPadding = 0
            self.textContainerInset = .zero
        }
        get {
            return false
        }
    }
}
enum types: Int {
    case Left,Right,Top,Buttom
}
extension UIView {
    
    internal func addLightColor( _ types: types,_ colors: [CGColor])  {
        var start: CGPoint = CGPoint(x: 0, y: 0)
        var end: CGPoint = CGPoint(x: 0, y: 1)
        let gradientLayer = CAGradientLayer()
        
        switch types {
        case .Left:
            do {
                start = CGPoint(x: 0, y: 0)
                end = CGPoint(x: 1, y: 0)
            }
        case .Right:
            do {
                start = CGPoint(x: 1, y: 0)
                end = CGPoint(x: 0, y: 0)
            }
        case .Top:
            do {
                start = CGPoint(x: 0, y: 0)
                end = CGPoint(x: 0, y: 1)
            }
        case .Buttom:
            do {
                start = CGPoint(x: 0, y: 1)
                end = CGPoint(x: 0, y: 0)
            }
         }
        
        layoutIfNeeded()
        removeLayer()
        gradientLayer.startPoint = start
        gradientLayer.endPoint =  end
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors
        
        layer.insertSublayer(gradientLayer, at: 0)
    }
    private func removeLayer() {
        guard let layers = self.layer.sublayers else { return }
        for layer in layers {
            if layer.isKind(of: CAGradientLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
    }
}
internal let Windows:UIWindow = {
    if #available(iOS 15.0, *) {
         return UIApplication.shared.connectedScenes.map({ $0 as? UIWindowScene }).compactMap({ $0 }).first?.windows.first ?? UIWindow()
    }else {
        return UIApplication.shared.windows.first ?? UIWindow()
    }
}()
extension UIView{
    func swiftDrawBoardDottedLine(width:CGFloat,lenth:CGFloat,space:CGFloat,cornerRadius:CGFloat,color:UIColor){
        guard let layers = self.layer.sublayers else { return }
        for layer in layers {
            if layer.isKind(of: CAShapeLayer.self) {
                layer.removeFromSuperlayer()
            }
        }
        self.layer.cornerRadius = cornerRadius
        let borderLayer =  CAShapeLayer()
        borderLayer.bounds = self.bounds
        
        borderLayer.position = CGPoint(x: self.bounds.midX, y: self.bounds.midY);
        borderLayer.path = UIBezierPath(roundedRect: borderLayer.bounds, cornerRadius: cornerRadius).cgPath
        borderLayer.lineWidth = width / UIScreen.main.scale
        
        
        borderLayer.lineDashPattern = [lenth,space] as? [NSNumber]
        borderLayer.lineDashPhase = 0.1
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = color.cgColor
        layer.insertSublayer(borderLayer, at: 0)
    }
    
}
typealias viewAction = (UIGestureRecognizer)->()
extension UIView {
    private static var keyAction: Bool = false
    @objc dynamic var action:viewAction? {
        set {
            objc_setAssociatedObject(self, &UIView.keyAction, newValue, .OBJC_ASSOCIATION_COPY)
        }
        get {
            if let action = objc_getAssociatedObject(self,  &UIView.keyAction) as? viewAction {
                return action
            }
            return nil
        }
    }
    
    @objc func GestureRecognizer(_ gesture: UIGestureRecognizer) {
        if action != nil {
            action!(gesture)
        }
    }
    
    internal func addGestureClick( response:@escaping viewAction) {
         self.isUserInteractionEnabled = true
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(GestureRecognizer(_ :)))
        tapGesture.numberOfTouchesRequired = 1
        tapGesture.numberOfTapsRequired = 1
        self.addGestureRecognizer(tapGesture)
        self.action = response
    }
}
extension UIAlertController {
    static func addAlertCtrol(_ otherBtns:Array<String>?, _ otherHandler:((Int) -> ())?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: nil,preferredStyle: .actionSheet)
            //Cancel
            let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler:{ (action) -> Void in
                //                cancelHandler?(action)
            })
            cancelAction.setValue(isColors(0x222222), forKey: "titleTextColor")
            alertController.addAction(cancelAction)
            //othe button
            if otherBtns != nil {
                for (index, value) in (otherBtns?.enumerated())! {
                    let otherAction = UIAlertAction(title: value, style: .default, handler: { (action) in
                        otherHandler!(index)
                    })
                    otherAction.setValue(isColors(0x000000).withAlphaComponent(0.8), forKey: "titleTextColor")
                    alertController.addAction(otherAction)
                }
            }
            Windows.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
extension String {
    internal func size(_ font:UIFont, MAXWidth:CGFloat = WIDTH) ->CGSize{
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = 0
        
         let attributes: [NSAttributedString.Key: Any] = [
            .paragraphStyle: paragraphStyle,
            .font:font
        ]
        
        let string = self as NSString
        var rect = string.boundingRect(with:CGSize(width:MAXWidth, height: UIScreen.main.bounds.height), options: [.usesLineFragmentOrigin,.usesFontLeading], attributes: attributes, context:nil).size
        rect.width += 0.5
        rect.height += 0.4
        return rect
    }
    
}

internal func showHints(_ text:String = "Success!", _ success :@escaping() -> Void) {
    selfs.present(UIAlertController(title: nil, message: text, preferredStyle: .alert), animated: true, completion: nil)
    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
        selfs.dismiss(animated: true, completion: nil)
        success()
    }
}
extension String {
    static func localeNum(_ locale : CGFloat) -> String {
        let ter = NumberFormatter()
        ter.groupingSeparator = ","
        ter.numberStyle = .decimal
        ter.decimalSeparator = "."
        ter.locale = Locale(identifier: "en_us")
        return ter.string(from: NSNumber(value: locale)) ?? String(format: "%d", locale)
    }
    
}
extension UIAlertController {
    static func AddAlertController(_ otherBtns:Array<String>?, otherHandler:((Int) -> ())?) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: nil, message: nil,preferredStyle: .actionSheet)
            //Cancel
            let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler:{ (action) -> Void in
                //                cancelHandler?(action)
            })
            cancelAction.setValue(isColors(0x222222), forKey: "titleTextColor")
            alertController.addAction(cancelAction)
            //othe button
            if otherBtns != nil {
                for (index, value) in (otherBtns?.enumerated())! {
                    let otherAction = UIAlertAction(title: value, style: .default, handler: { (action) in
                        otherHandler!(index)
                    })
                    otherAction.setValue(isColors(0x000000).withAlphaComponent(0.8), forKey: "titleTextColor")
                    alertController.addAction(otherAction)
                }
            }
//            UIApplication.shared.windows.filter({$0.isKeyWindow}).first!.rootViewController?.present(alertController, animated: true, completion: nil)
            Windows.rootViewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
internal func IsNilStr(_ value: String?) -> Bool {
    if (nil == value) {
        return true
    }else{
        if let myValue  = value{
            return myValue == "" || myValue == "(null)" || myValue == "<null>" || 0 == myValue.count
        }else{
            return true
        }
    }
}
func RotateJson(_ jsonStr: String) -> [Any]? {
     if jsonStr.isEmpty {
         return nil
     }
     do {
         let jsonData = jsonStr.data(using: .utf8)!
         let ary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [Any]
         return ary
     } catch {
         return nil
     }
 }
extension UIView {
    func allImgs() -> [UIImageView] {
        var but = self.subviews.compactMap { $0 as? UIImageView }
        for subview in self.subviews {
            but += subview.allImgs()
        }
        return but
    }
}
func getJson(_ jsonStr: String) -> [Any]? {
     if jsonStr.isEmpty {
         return nil
     }
     do {
         let jsonData = jsonStr.data(using: .utf8)!
         let ary = try JSONSerialization.jsonObject(with: jsonData, options: []) as? [Any]
         return ary
     } catch {
         return nil
     }
 }
func ArrayToString(_ array:[Any])->String{
    if (!JSONSerialization.isValidJSONObject(array)) {
        return ""
    }
    let data : Data! = try? JSONSerialization.data(withJSONObject: array, options: [])
    let str = NSString(data:data, encoding: String.Encoding.utf8.rawValue)
    return str! as String
}
func arrayJSONObject(_ dict:[String:String])->String {
    let dataObject = try? JSONSerialization.data(withJSONObject: dict, options: JSONSerialization.WritingOptions.init(rawValue: 0))
    let str = NSString(data: dataObject!, encoding: String.Encoding.utf8.rawValue)
    return str! as String
}



extension UIResponder {
    static var currentFirstResponder: UIResponder? {
        _currentFirstResponder = nil
        UIApplication.shared.sendAction(#selector(findFirstResponder), to: nil, from: nil, for: nil)
        return _currentFirstResponder
    }
    
    @objc private func findFirstResponder() {
        UIResponder._currentFirstResponder = self
    }
    private static weak var _currentFirstResponder: UIResponder?
}
extension UIView {
    func allImageViews() -> [UIImageView] {
        var ImageViews = self.subviews.compactMap { $0 as? UIImageView }
        for subview in self.subviews {
            ImageViews += subview.allImageViews()
        }
        return ImageViews
    }
}
