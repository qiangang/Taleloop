
import UIKit
import RongIMLibCore
import RongChatRoom
import AVFAudio
import AVFoundation

extension TaleMessageDialogueController : UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view?.endEditing(false)
        if IsNilStr(textField.text){}else{
            SendMsgTextObj("\(self.model.chylomicron)", textField.text!) {
                self.getHistoryChatMeans()
            }
        }
        return true
    }
}

class TaleMessageDialogueController: BaseController {
    private var playIndex:Int = -89
        
    private var recorder: AVAudioRecorder?
    private var audioPlayer : AVAudioPlayer?
        
    var model = TaleGenModel()
    private var MsgArray = [RCMessage]()
        
    @IBOutlet weak var SaysomeTextField: UITextField!{
        didSet {
            self.SaysomeTextField.delegate = self
            self.SaysomeTextField.returnKeyType = .send
        }
    }
    @IBOutlet weak var RightBtn: UIButton!
    let safeHeight = HEIGHT - StatusBarHei - NavigationHeight - BotmSafetyHeight - 56
    @IBOutlet weak var TableHeight: NSLayoutConstraint!
    @IBOutlet weak var OneView: UIView!
    @IBOutlet weak var TwoView: UIView!
    @IBOutlet weak var LyBtn: UIButton!
    @IBOutlet weak var ThreeView: UIView!
        
    @IBOutlet weak var BgView: UIView!
    private var isLongPressDetected = false
    let luyingView = TaleLuyingView.initNibName()
    @IBOutlet weak var LuyingBtn: UIButton!
    @IBOutlet weak var BottomView: UIView!
    private var arrayPhiz = [String]()
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleExpressionColl.self])
        }
    }
    private var longRer: UILongPressGestureRecognizer!
        
    @IBOutlet weak var CollecionsLayout: UICollectionViewFlowLayout!{
        didSet {
            self.CollecionsLayout.itemSize = .init(width: (WIDTH - 40 - 36) / 4, height: (WIDTH - 40 - 36) / 4)
            self.CollecionsLayout.minimumLineSpacing = 12
            self.CollecionsLayout.minimumInteritemSpacing = 12
            self.CollecionsLayout.sectionInset = .init(top: 0, left: 20, bottom: 0, right: 20)
        }
    }
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            let dic = [TaleMessageDialogueCell.self,TaleMessageDialogueImgCell.self,TaleMessageDialogueSoundCell.self]
            self.TableView.AddRegisterCell(dic)
        }
    }
        
    @IBOutlet weak var BreomTextView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
                
        for sr in 0..<12 {
            self.arrayPhiz.append("TaleExpression__\(sr + 1)")
        }
                
        DispatchQueue.main.async {
            self.BreomTextView.layoutIfNeeded()
            self.BreomTextView.swiftDrawBoardDottedLine(width: 15, lenth: 5, space: 3, cornerRadius: 15, color: isColors(0xF7BF49))
        }
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
        self.BgView.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                return
            }
            self.view.endEditing(true)
            UIView.animate(withDuration: 0.25) {
                self.OneView.isHidden = true
                self.TwoView.isHidden = true
                self.ThreeView.isHidden = true
                self.TableHeight.constant = self.safeHeight
            }
        }
                
        self.navigationItem.rightBarButtonItem = .init(customView: self.RightBtn)
        let tiView = TaleMessageTitleView.initNibName()
        tiView.model = self.model
        self.navigationItem.titleView = tiView
        self.TableHeight.constant = self.safeHeight
        self.TableView.scrollToRow(false)
                
        self.getHistoryChatMeans(false)
                
                
        longRer = UILongPressGestureRecognizer(target: self, action: #selector(longRerLuying(_:)))
        longRer.minimumPressDuration = 0.5
        self.LuyingBtn.addGestureRecognizer(longRer)
        self.LuyingBtn.isUserInteractionEnabled = true
                
        self.view.addSubview(self.luyingView)
        self.luyingView.snp.makeConstraints { make in
            make.center.equalTo(self.view)
        }
        self.luyingView.isHidden = true
    }
        
    @IBAction private func MoreBtnAction(_ sender: UIButton) {
        if self.model.chylomicron == TaleUserData.shared.data.chylomicron {
            let remoView = BottomRemoveView.initNibName()
            remoView.userID = self.model.chylomicron
            Windows.addSubview(remoView)
            remoView.callIndexBlock = {[weak self] idx in
                guard let self = self else { return }
                remoView.popHide()
                UserDefaults.standard.set("True", forKey: "Block:\(self.model.chylomicron)")
                self.navigationController?.popToRootViewController(animated: true)
            }
        } else {
            let howView = BottomBounceView.initNibName()
            howView.userID = self.model.chylomicron
            Windows.addSubview(howView)
            howView.callIndexBlock = {[weak self] mdl in
                guard let self = self else { return }
                howView.popHide()
                UserDefaults.standard.set("True", forKey: "Block:\(self.model.chylomicron)")
                self.navigationController?.popViewController(animated: true)
            }
        }
    }
        
    @objc
    private func longRerLuying(_ gestureRecognizer: UILongPressGestureRecognizer) {
        addSystemAuth(.microphone) { [self] in
            if gestureRecognizer.state == .began {
                self.luyingView.isHidden = false
                self.luyingView.initBegin()
                self.recordingRoom(false)
            } else if gestureRecognizer.state == .ended {
                if !self.isLongPressDetected {
                    self.recordingRoom(true)
                    self.luyingView.isHidden = true
                                        
                } else {
                    self.isLongPressDetected = false
                }
            } else if gestureRecognizer.state == .changed {
                isLongPressDetected = false
            }
        } _: {}
    }
    private func getHistoryChatMeans(_ IsTrue : Bool = true) {
        RCCoreClient.shared().getHistoryMessages(.ConversationType_PRIVATE, targetId: "\(self.model.chylomicron)", oldestMessageId: 0, count: 40) { ary in
            self.MsgArray.removeAll()
            if ary?.count ?? 0 >  0  {
                for rec in ary!{
                    if self.MsgArray.count == 0 {
                        self.MsgArray.append(rec)
                    }else{
                        self.MsgArray.insert(rec, at: 0)
                    }
                }
            }
            DispatchQueue.main.async {
                self.TableView.reloadData()
                self.SaysomeTextField.text = nil
                self.TableView.scrollToRow(IsTrue)
            }
        }
    }
        
        
    @objc
    private func keyboardWillShow(_ notification: Notification) {
        self.OneView.isHidden = true
        self.TwoView.isHidden = true
        self.ThreeView.isHidden = true
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            let keyboardHeight = keyboardSize.height
            self.BottomView.transform = .init(translationX: 0, y: -keyboardHeight + BotmSafetyHeight )
            self.TableHeight.constant = self.safeHeight - keyboardHeight
            DispatchQueue.main.async {
                self.TableView.scrollToRow(false)
            }
        }
    }
    @objc
    private func keyboardWillHide(_ notification: Notification) {
        self.BottomView.transform = .identity
        self.TableHeight.constant = self.safeHeight
    }
        
    @IBAction private func BtomAction(_ sender: UIButton) {
        self.view.endEditing(true)
        self.LyBtn.isSelected = false
        self.OneView.isHidden = true
        self.TwoView.isHidden = true
        self.ThreeView.isHidden = true
        self.TableView.scrollToRow()
        switch sender.tag {
        case 1:
            self.TableHeight.constant = self.safeHeight - 78
            UIView.animate(withDuration: 0.25) {
                self.OneView.isHidden = false
            }
        case 2:
            self.TableHeight.constant = self.safeHeight - 245
            UIView.animate(withDuration: 0.25) {
                self.ThreeView.isHidden = false
            }
        default:
            break
        }
    }
        
    @IBAction private func FaceBtnAction(_ sender: UIButton) {
        switch sender.tag {
        case 1:
            addSystemAuth(.PhotoAlbum) {
                DispatchQueue.main.async {
                    let pickerVC = UIImagePickerController()
                    pickerVC.delegate = self
                    pickerVC.allowsEditing = false
                    self.present(pickerVC, animated: true, completion: nil)
                }
            } _: {}
                        
        case 2:
            self.TableHeight.constant = self.safeHeight - 78 - 126
            UIView.animate(withDuration: 0.25) {
                sender.isSelected = true
                self.TwoView.isHidden = false
            }
        case 3:
            let vc = TaleDialedController()
            vc.model = self.model
            let navi = BaseNavController(rootViewController: vc)
            navi.modalPresentationStyle = .fullScreen
            self.present(navi, animated: true)
        default:
            break
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }
    deinit {
        self.pauseown()
    }
}
extension TaleMessageDialogueController:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.MsgArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let mdl = self.MsgArray[indexPath.item]
                
        if mdl.objectName == "RC:TxtMsg" {
            let mdls = mdl.content! as! RCTextMessage
            if mdls.content.contains("TaleExpression__"){
                let cell = tableView.AddDequCell(TaleMessageDialogueImgCell.self, for: indexPath)
                cell.ImgView.image = .init(named: mdls.content)
                cell.ImgView.layer.borderWidth = 0
                return cell
            }else{
                let cell = tableView.AddDequCell(TaleMessageDialogueCell.self, for: indexPath)
                cell.model = mdl
                return cell
            }
        }else if mdl.objectName == "RC:ImgMsg" {
            let cell = tableView.AddDequCell(TaleMessageDialogueImgCell.self, for: indexPath)
            cell.mdl = mdl
            cell.ImgView.layer.borderWidth = 2
            return cell
        }
        let cell = tableView.AddDequCell(TaleMessageDialogueSoundCell.self, for: indexPath)
        cell.model = mdl
        cell.CallModel = {[weak self] mdl, seld in
            guard let self = self else { return }
            self.playIndex = indexPath.row
            if seld {
                let mdel = mdl.content! as! RCVoiceMessage
                let wavData = mdel.wavAudioData as NSData
                                
                let asudioSession = AVAudioSession.sharedInstance()
                do {
                    try asudioSession.setCategory(AVAudioSession.Category.playback)
                    try asudioSession.setActive(true)
                    try asudioSession.setPreferredIOBufferDuration(1)
                }catch{}
                                
                self.pauseown()
                do {
                    try self.audioPlayer = AVAudioPlayer(data: wavData as Data)
                    self.audioPlayer?.delegate = self
                    self.audioPlayer?.play()
                }catch{}
            }else{
                self.pauseown()
            }
        }
        return cell
    }
    private func pauseown(){
        audioPlayer?.pause()
        audioPlayer?.stop()
        audioPlayer = nil
    }
}
extension TaleMessageDialogueController : AVAudioPlayerDelegate {
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        let cell = self.TableView.cellForRow(at: .init(row: self.playIndex, section: 0)) as? TaleMessageDialogueSoundCell
        if flag {
            cell!.SleepRoughBtn.isSelected = false
        } else {
            cell!.SleepRoughBtn.isSelected = false
        }
    }
}

extension TaleMessageDialogueController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        arrayPhiz.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleExpressionColl.self, for: indexPath)
        coll.ImgView.image = .init(named: self.arrayPhiz[indexPath.item])
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let ary = self.arrayPhiz[indexPath.item]
        SendMsgTextObj("\(self.model.chylomicron)", ary) {
            self.getHistoryChatMeans()
        }
    }
        
        
}
extension TaleMessageDialogueController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        let image = info[.originalImage] as? UIImage
        SendMsgImageObj("\(self.model.chylomicron)", image!) {
            self.getHistoryChatMeans()
        }
    }
}
extension TaleMessageDialogueController {
    private func recordingRoom(_ IsTrue: Bool = false) {
        var uing = ""
        if let filedsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).last {
            uing = filedsPath.appending("/TaleoopVideo.wav")
        }
        let url = URL(fileURLWithPath: uing)
        if IsTrue == false{
                        
            let session = AVAudioSession.sharedInstance()
            do {
                try session.setCategory(.playAndRecord)
            } catch let error {
            }
                        
            let dict: [String:Any] = [AVEncoderAudioQualityKey: NSNumber(value: AVAudioQuality.medium.rawValue),
                                                 AVFormatIDKey: NSNumber(value: kAudioFormatLinearPCM),
                                           AVEncoderBitRateKey: NSNumber(value: 16),
                                               AVSampleRateKey: NSNumber(value: 8000),
                                         AVNumberOfChannelsKey: NSNumber(value: 1),
                                        AVLinearPCMBitDepthKey: NSNumber(value: 16),
                                   AVLinearPCMIsNonInterleaved: 0,
                                         AVLinearPCMIsFloatKey: 0,
                                     AVLinearPCMIsBigEndianKey: 0,
            ]
            do {
                self.recorder = try AVAudioRecorder(url: url, settings: dict)
                self.recorder?.record()
            } catch let error {
            }
        } else {
            self.recorder?.stop()
            guard let auds:NSData = try NSData(contentsOf: URL(fileURLWithPath: uing)) else{
                return
            }
            let asset11 = AVURLAsset(url: NSURL(fileURLWithPath: uing) as URL) as AVURLAsset
            let totalSeconds = Int(CMTimeGetSeconds(asset11.duration))
                        
            if totalSeconds > 1 {
                DispatchQueue.main.async {
                    HideLoad()
                }
                let voiceMessage:RCVoiceMessage = RCVoiceMessage(audio: auds as Data, duration: totalSeconds)
                RCCoreClient.shared().sendMessage(.ConversationType_PRIVATE, targetId: "\(self.model.chylomicron)", content: voiceMessage, pushContent: nil, pushData: nil) { messageId in
                    DispatchQueue.main.async {
                        HideLoad()
                    }
                    self.getHistoryChatMeans()
                }error: { nErrorCode, messageId in
                    DispatchQueue.main.async {
                        HideLoad()
                    }
                }
            }
        }
    }
}
