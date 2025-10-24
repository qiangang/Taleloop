
import UIKit

class TaleFollowController: BaseController {
    private var arrayUser = [TaleGenModel]()
    internal var selectIndex : Int = 0
    let headerView = UIView()
        
    @IBOutlet weak var TablesView: UITableView!{
        didSet {
            self.TablesView.AddRegisterCell([TaleFollowCell.self])
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Following"
        if self.selectIndex == 1 {
            self.NameTitle.text = "Following"
            self.requestMarriage()
        }else if self.selectIndex == 2 {
            self.NameTitle.text = "Followers"
            self.requestShortcoming()
        }else if self.selectIndex == 3 {
            self.NameTitle.text = "Blocklist"
            self.followTool()
        }
                
        self.TablesView.addSubview(self.LankView)
        self.LankView.snp.makeConstraints { make in
            make.center.equalTo(self.TablesView)
        }
        self.LankView.isHidden = true
                
    }
        
    private func requestShortcoming(){
        let ary = [
            "tapestry":1,
            "ultramicroscope":20
        ]
        ShowLoad()
        GetShortcomingBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.arrayUser.removeAll()
                let ardel = TaleUserModel(armonica)
                self.arrayUser.append(contentsOf: ardel.armonica ?? [])
                                
                self.LankView.isHidden = self.arrayUser.count > 0 ? true : false
                self.TablesView.reloadData()
            }
        }
    }
        
    private func requestMarriage(){
        let ary = [
            "tapestry":1,
            "ultramicroscope":20
        ]
        ShowLoad()
        GetMarriageBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.arrayUser.removeAll()
                let ardel = TaleUserModel(armonica)
                self.arrayUser.append(contentsOf: ardel.armonica ?? [])
                                
                self.LankView.isHidden = self.arrayUser.count > 0 ? true : false
                self.TablesView.reloadData()
            }
        }
    }
        
    private func followTool(){
        let ary = [
            "tapestry":1,
            "ultramicroscope":20
        ]
        ShowLoad()
        GetChapterBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.arrayUser.removeAll()
                let ardol = TaleUserModel(armonica)
                self.arrayUser.append(contentsOf: ardol.armonica ?? [])
                self.LankView.isHidden = self.arrayUser.count > 0 ? true : false
                self.TablesView.reloadData()
            }
        }
    }
        
}
extension TaleFollowController : UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayUser.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleFollowCell.self, for: indexPath)
        let midl = self.arrayUser[indexPath.item]
        cell.model = midl
        if self.selectIndex == 1 {
            cell.OneBtn.isHidden = false
            cell.OneBtn.isSelected = true
        }else if self.selectIndex == 2 {
            cell.TwoBtn.isHidden = false
                        
        } else if self.selectIndex == 3 {
            cell.ThreeBtn.isHidden = false
        }
        cell.userMdlBlock = {[weak self] mdl in
            guard let `self` = self else { return }
            self.arrayUser.remove(at: indexPath.item)
            self.LankView.isHidden = self.arrayUser.count > 0 ? true : false
            self.TablesView.reloadData()
            UserDefaults.standard.removeObject(forKey: "Block:\(midl.chylomicron)")

        }
        cell.callBlock = {[weak self] in
            guard let self = self else { return }
            self.requestShortcoming()
        }
                
        return cell
    }
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 24
    }
        
}
