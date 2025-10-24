
import UIKit

class TaleHotPostController: BaseController {
    private var arrayMdl = [TaleBeModel]()
    internal var titleLabel:String?
    @IBOutlet weak var TabeleView: UITableView!{
        didSet {
            self.TabeleView.AddRegisterCell([TaleDiscoverCell.self])
        }
    }
    @IBOutlet weak var WayImgView: UIImageView!
    @IBOutlet weak var PostImgView: UIImageView!
        
    @IBOutlet weak var topicLabel: UILabel!
    @IBOutlet weak var MowaView: UIView!
        
    @IBOutlet weak var OneImgView: UIImageView!
    @IBOutlet weak var TwoImgView: UIImageView!
    @IBOutlet weak var ThreeImgView: UIImageView!
    var nameImgStr:String?
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Topic"
        self.topicLabel.text = self.titleLabel
                
        self.WayImgView.image = .init(named: self.nameImgStr ?? "TickeIcon")
                
        DispatchQueue.main.async {
            self.MowaView.layoutIfNeeded()
            self.MowaView.addLightColor(.Top, [isColors(0xCD873C).withAlphaComponent(0.0).cgColor,isColors(0xF7BF49).withAlphaComponent(0.74).cgColor])
        }
        self.PostImgView.addGestureClick {[weak self] ges in
            guard let `self` = self else {
                  return
            }
            let vc = TaleNewsReleaseController()
            vc.tailgunningName = self.titleLabel!
            self.navigationController?.pushViewController(vc, animated: true)
            vc.callModel = {[weak self] mdl in
                guard let self = self else { return }
                self.arrayMdl.insert(mdl, at: 0)
                self.TabeleView.reloadData()
            }
        }
                
                
        self.TabeleView.addSubview(self.LankView)
        self.LankView.snp.makeConstraints { make in
            make.center.equalTo(self.TabeleView)
        }
        self.LankView.isHidden = true
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.GetDefin()
    }
    private func GetDefin(){
        if self.arrayMdl.count == 0 {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":self.titleLabel!]) { armonica, success in
            HideLoad()
            if success {
                self.arrayMdl.removeAll()
                let ardol = TaleBeListModel(armonica)
                self.arrayMdl.append(contentsOf: ardol.armonica ?? [])
                self.TabeleView.reloadData()
                                
                if self.arrayMdl.count > 2 {
                    self.ThreeImgView.isHidden = false
                    let miad = self.arrayMdl[2]
                    self.ThreeImgView.sd_setUrlString(miad.importance?.groupware)
                }
                if self.arrayMdl.count > 1 {
                    self.TwoImgView.isHidden = false
                    let miad = self.arrayMdl[1]
                    self.TwoImgView.sd_setUrlString(miad.importance?.groupware)
                }
                if self.arrayMdl.count > 0 {
                    self.OneImgView.isHidden = false
                    let miad = self.arrayMdl[0]
                    self.OneImgView.sd_setUrlString(miad.importance?.groupware)
                }
                                
                self.LankView.isHidden = self.arrayMdl.count > 0 ? true : false
                                
            }
        }
    }
}
extension TaleHotPostController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayMdl.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleDiscoverCell.self, for: indexPath)
        cell.model = self.arrayMdl[indexPath.item]
        cell.callIndexBlock = {[weak self] idsx in
            guard let self = self else { return }
            self.arrayMdl.removeAll { mdl in
                if mdl.importance?.chylomicron == idsx {
                    return true
                }else{
                    return false
                }
            }
            self.TabeleView.reloadData()
        }
        cell.syntonyBlock = {[weak self] in
            guard let `self` = self else { return }
            self.arrayMdl.remove(at: indexPath.item)
            tableView.reloadData()
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = TaleDiscoverDetailController()
        vc.model = self.arrayMdl[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
