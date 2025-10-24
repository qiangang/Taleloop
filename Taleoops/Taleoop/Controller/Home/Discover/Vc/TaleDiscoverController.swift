
import UIKit

class TaleDiscoverController: BaseController {
    var aryStr = [TaleBeModel]()
        
    private var arrayModel = [TaleBeModel]()
    let HeaderView = TaleDiscoverHeaderView.initNibName()
    let footView = UIView()
        
    @IBOutlet weak var PostImgView: UIImageView!
    @IBOutlet weak var BtomHeight: NSLayoutConstraint!
    @IBOutlet weak var BtomView: UIView!
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            let regDic = [TaleDiscoverCell.self,TaleDiscoverTopicCell.self]
            self.TableView.AddRegisterCell(regDic)
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
                
        self.BtomHeight.constant += BotmSafetyHeight
        DispatchQueue.main.async {
            self.BtomView.addLightColor(.Top, [isColors(0xFFFAE6).withAlphaComponent(0.0).cgColor,isColors(0xFFFAE6).withAlphaComponent(1.0).cgColor])
        }
                
        HeaderView.PingmuView()
                
        PostImgView.addGestureClick {[weak self] ges in guard let self = self else { return }
            let vc = TaleNewsReleaseController()
            self.navigationController?.pushViewController(vc, animated: true)
            vc.callModel = {[weak self] mdl in guard let self = self else { return }
                self.arrayModel.insert(mdl, at: 0)
                self.TableView.reloadData()
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.Efinition()
        self.requestFloaction()
    }
    @objc private func Efinition(){
        if self.arrayModel.count == 0  {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":"Story Posts"]) { armonica, success in
            HideLoad()
            if success {
                self.arrayModel.removeAll()
                let ardol = TaleBeListModel(armonica)
                self.arrayModel.append(contentsOf: ardol.armonica ?? [])
                self.TableView.reloadData()
            }
        }
    }
    @objc private func requestFloaction(){
        GetDefinitionBlock(["tailgunning":"Floatingrice"]) { armonica, success in
             if success {
                self.aryStr.removeAll()
                let ardol = TaleBeListModel(armonica)
                self.aryStr.append(contentsOf: ardol.armonica ?? [])
                self.TableView.reloadData()
            }
        }
    }
}
extension TaleDiscoverController : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0  {
            return 1
        }
        return  self.arrayModel.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.AddDequCell(TaleDiscoverTopicCell.self, for: indexPath)
            cell.dataSource = self.aryStr
            return cell
        }else{
            let cell = tableView.AddDequCell(TaleDiscoverCell.self, for: indexPath)
            cell.model = self.arrayModel[indexPath.item]
            cell.callIndexBlock = {[weak self] idsx in
                guard let self = self else { return }
                self.arrayModel.removeAll { mdl in
                    if mdl.importance?.chylomicron == idsx {
                        return true
                    }else{
                        return false
                    }
                }
                self.TableView.reloadData()
            }
            cell.syntonyBlock = {[weak self] in
                guard let `self` = self else { return }
                self.arrayModel.remove(at: indexPath.item)
                tableView.reloadData()
            }
            return cell
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            return
        }
        let vc = TaleDiscoverDetailController()
        vc.model = self.arrayModel[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
        
        
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
                
        let HeaderTwoView = TaleDisHeaderTwoView.initNibName()
        if section == 0 {
            HeaderTwoView.TopHeight.constant = 50
            HeaderTwoView.HotLab.text = "Hot topic"
            HeaderTwoView.ImgView.image = .init(named: "HotTopicICon")
        }else {
            HeaderTwoView.TopHeight.constant = 13
            HeaderTwoView.HotLab.text = "Story posts"
            HeaderTwoView.ImgView.image = .init(named: "StoryPostrsIcon")
        }
        return HeaderTwoView
                
    }
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
        
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.footView
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if section == 0 {
            return 0.01
        }
        return  HeightBottom
    }
}
