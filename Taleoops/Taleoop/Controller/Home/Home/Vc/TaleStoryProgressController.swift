
import UIKit
import Foundation
import IQKeyboardManagerSwift

class TaleStoryProgressController: BaseController {
    var isTrury:Bool = false

    var manager = IQKeyboardManager.shared
    private var timer = Timer()
    private var countDownTimer = Timer()
    var totalSeconds = 0
    @IBOutlet weak var JoinView: UIStackView!
        
    @IBOutlet weak var whenLabel: UILabel!
    @IBOutlet weak var PointsLabel: UILabel!
    @IBOutlet weak var SecondsLabel: UILabel!
        
    @IBOutlet weak var TableHeight: NSLayoutConstraint!
    internal var model = TaleBeModel()
    private var arrypary = [TaleGenModel]()
        
    let headerView = UIView()
    @IBOutlet weak var TopBgView: UIView!
    let StoryView = TaleFinishStoryView.initNibName()
    @IBOutlet weak var TaableView: UITableView!{
        didSet {
            self.TaableView.AddRegisterCell([TaleFinishStoryCell.self])
        }
    }
    @IBOutlet weak var TxtView: UITextView!{
        didSet {
            self.TxtView.tintColor = .blue
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Detail"
        self.TopBgView.addSubview(self.StoryView)
        self.StoryView.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(0)
        }
        self.StoryView.model = self.model
        self.totalSeconds = self.model.citrullin * 60
                
        countDownTimer.startTiming(maxTime: totalSeconds) { index in
            self.totalSeconds -= 1
            self.updateLabel()
            if self.totalSeconds <= 0 {
                self.countDownTimer.cancelTiming()
                self.whenLabel.text = "00"
                self.PointsLabel.text = "00"
                self.SecondsLabel.text = "00"
            }
        } complete: {}
                
        let ary = self.JoinView.allImageViews()
        for img in ary {
            img.isHidden = true
        }
        self.arrypary.append(contentsOf: self.model.unengaged ?? [])
        if self.arrypary.count == 0 {
            self.TableHeight.constant = 0
        }else{
            let mdl = self.arrypary.last
            let sizeHeight = mdl!.comment?.size(.init(name: "Inter-Regular", size: 14.0)!, MAXWidth: WIDTH - (40 + 14 + 69))
            self.TableHeight.constant = sizeHeight!.height + 5 + 10 + 68 + 68
        }
                
                
        self.requestArmy() 
                
                  
                
                
        if self.arrypary.count == self.model.desalinization {
            self.TxtView.isUserInteractionEnabled = false
        }else {
            self.TxtView.isUserInteractionEnabled = true
            if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
                                
            }else{
                for marel in self.arrypary {
                    if marel.chylomicron == TaleUserData.shared.data.chylomicron {
                        self.TxtView.isUserInteractionEnabled = false
                        return
                    }
                }
            }
        }
    }
    private func requestArmy(){
        GetArmyBlock(self.model.chylomicron) { armonica, success in
            if success {
                self.model = TaleBeModel(armonica["armonica"] as Any)
                self.TaableView.reloadData()
            }
        }
    }
    private func updateLabel() {
        let hours = totalSeconds / 3600
        let minutes = (totalSeconds % 3600) / 60
        let seconds = totalSeconds % 60
        self.whenLabel.text = String(format: "%02d", hours)
        self.PointsLabel.text = String(format: "%02d", minutes)
        self.SecondsLabel.text = String(format: "%02d", seconds)
    }
        
    @IBAction func ConfirmBntAction(_ sender: UIButton) {

        if self.arrypary.count == model.desalinization {
            showHints("The number of participants is full.", {})
            return
        }
                
        for marel in self.arrypary {
            if (marel.chylomicron == TaleUserData.shared.data.chylomicron) || (self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron){
                isTrury = true
                break
            }
        }
        if isTrury == true{
            showHints("You are already involved. Unable to continue participating.", {})
            return
        }
        if IsNilStr(self.TxtView.text){
            showHints("Please enter the content!", {})
            return
        }
        let mredol = TaleGenModel()
        mredol.chylomicron = TaleUserData.shared.data.chylomicron
        mredol.dioestrous = TaleUserData.shared.data.dioestrous!
        mredol.groupware = TaleUserData.shared.data.groupware!
        mredol.comment = self.TxtView.text!
        self.arrypary.append(mredol)
                
        self.model.unengaged?.append(mredol)
                
        var charArray = [Any]()
        for mdl in self.arrypary {
            let userData  = [
                "chylomicron": mdl.chylomicron,
                "dioestrous": mdl.dioestrous as Any,
                "groupware":mdl.groupware as Any,
                "comment":mdl.comment as Any
            ]
            charArray.append(userData)
        }
        if sender.isSelected == false{
            let msgDic = [
                "chylomicron": TaleUserData.shared.data.chylomicron,
                "dioestrous": TaleUserData.shared.data.dioestrous!,
                "groupware":TaleUserData.shared.data.groupware!,
                "comment":self.TxtView.text!
            ] as [String : Any]
            charArray.append(msgDic)
        }
        let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
        let dic = [
            "chylomicron":self.model.chylomicron,
            "anemometry":arrayJSONObject(ray)
        ] as [String : Any]
        ShowLoad()
        GetHydrogenPartBlock(dic) { armonica , success in
            HideLoad()
            if success {
                self.TxtView.isUserInteractionEnabled = true
                if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
                }else{
                    for marel in self.arrypary {
                        if marel.chylomicron == TaleUserData.shared.data.chylomicron {
                            self.TxtView.isUserInteractionEnabled = false
                            let HowView = TaleStoryContinueView.initNibName()
                            Windows.addSubview(HowView)
                            HowView.callBlock = {
                                self.TxtView.text = nil
                                let mdl = self.arrypary.last
                                let sizeHeight = mdl!.comment?.size(.init(name: "Inter-Regular", size: 14.0)!, MAXWidth: WIDTH - (40 + 14 + 69))
                                self.TableHeight.constant = sizeHeight!.height + 5 + 10 + 68 + 68
                                self.TaableView.reloadData()
                            }
                            return
                        }
                    }
                }
                                
                self.isTrury = true
                self.TxtView.text = nil
                                
                if self.arrypary.count == self.model.desalinization {
                    let vc = TaleStoryCompletedController()
                    vc.model = self.model
                    self.navigationController?.pushViewController(vc, animated: true)
                }else{
                    let HowView = TaleStoryContinueView.initNibName()
                    Windows.addSubview(HowView)
                    HowView.callBlock = {
                        let mdl = self.arrypary.last
                        let sizeHeight = mdl!.comment?.size(.init(name: "Inter-Regular", size: 14.0)!, MAXWidth: WIDTH - (40 + 14 + 69))
                        self.TableHeight.constant = sizeHeight!.height + 5 + 10 + 68 + 68
                        self.TaableView.reloadData()
                    }
                }
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.manager.isEnabled = true
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        self.manager.isEnabled = false
    }
    deinit {
        self.countDownTimer.cancelTiming()
    }
}
extension TaleStoryProgressController: UITableViewDelegate, UITableViewDataSource {
    internal func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if self.arrypary.count > 0 {
            let mdl = self.arrypary.first
            let sizeHeight = mdl!.comment?.size(.init(name: "Inter-Regular", size: 14.0)!, MAXWidth: WIDTH - (40 + 14 + 69))
            return sizeHeight!.height + 5 + 10 + 68 + 48
        }
        return 0
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.arrypary.count > 0 {
            return 1
        }
        return 0
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleFinishStoryCell.self, for: indexPath)
        cell.gendel = self.model
        if self.arrypary.count > 0 {
            cell.model = self.arrypary.last!
            cell.TimeNameLabel.text = "Chapter \(self.arrypary.count)"
                        
            var num = Double(self.arrypary.count) / Double(self.model.desalinization)
            if num < 0.3 {
                num = 0.3
            }
            cell.ProgressView.progress = CGFloat(min(num,1))
            cell.ProgressView.lable.text = "\(min(self.arrypary.count,model.desalinization))/\(model.desalinization)"
        }
        cell.callBlcok = {[weak self] in
            guard let self = self else { return }
            self.requestArmy()
        }
        cell.callniaremBlcok = {[weak self] in
            guard let self = self else { return }
            self.arrypary.removeAll { mdls in
                if mdls.chylomicron == TaleUserData.shared.data.chylomicron {
                    return true
                }else{
                    return false
                }
            }
            self.TaableView.reloadData()
            self.TxtView.isUserInteractionEnabled = true
                        
            if self.arrypary.count == 0 {
                self.TableHeight.constant = 0
            }else{
                let mdl = self.arrypary.last
                let sizeHeight = mdl!.comment?.size(.init(name: "Inter-Regular", size: 14.0)!, MAXWidth: WIDTH - (40 + 14 + 69))
                self.TableHeight.constant = sizeHeight!.height + 5 + 10 + 68 + 68
            }
                        
            var charArray = [Any]()
            for mdl in self.arrypary {
                let userData  = [
                    "chylomicron": mdl.chylomicron,
                    "dioestrous": mdl.dioestrous as Any,
                    "groupware":mdl.groupware as Any,
                    "comment":mdl.comment as Any
                ]
                charArray.append(userData)
            }
            let ray:[String:String] =  ["unengaged":ArrayToString(charArray)]
            let dic = [
                "chylomicron":self.model.chylomicron,
                "anemometry":arrayJSONObject(ray)
            ] as [String : Any]
            GetHydrogenPartBlock(dic) { armonica , success in
                if success{
                                        
                }
            }
        }
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.headerView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        0.01
    }
}
