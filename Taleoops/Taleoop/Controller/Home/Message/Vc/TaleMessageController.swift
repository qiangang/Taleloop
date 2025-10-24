
import UIKit
import RongIMLibCore

class TaleMessageController: BaseController {
    private var arrayUser = [TaleGenModel]()
    private var arrayMsg = [RCConversation]()
        
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleMessageColl.self])
        }
    }
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            self.TableView.AddRegisterCell([TaleMessageCell.self])
        }
    }
    @IBOutlet weak var TableBotemHeight: NSLayoutConstraint!
    @IBOutlet weak var BottomBackgroundView: UIView!
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.TableBotemHeight.constant = HeightBottom
        DispatchQueue.main.async {
            self.BottomBackgroundView.layoutIfNeeded()
            self.BottomBackgroundView.addLightColor(.Top, [isColors(0xFFFAE6).withAlphaComponent(0.0).cgColor,isColors(0xFFFAE6).withAlphaComponent(1.0).cgColor])
        }
                
        self.TableView.addSubview(self.LankView)
        self.LankView.snp.makeConstraints { make in
            make.center.equalTo(self.TableView)
        }
        self.LankView.isHidden = true
                
    }
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.getConversationList()
        self.requestBrow()
    }
    private func requestBrow(){
        GetBrowBlock(["tapestry":1]) { armonica , success in
            if success {
                self.arrayUser.removeAll()
                let ordel = TaleUserModel(armonica)
                self.arrayUser.append(contentsOf: ordel.armonica ?? [])
                self.CollectionsView.reloadData()
            }
        }
    }
    private func getConversationList(){
        RCCoreClient.shared().getConversationList([1]){reply in
            self.arrayMsg.removeAll()
                        
            for naredel  in reply ?? []{
                if let greeting = UserDefaults.standard.string(forKey: "Block:\(naredel.targetId)") {
                }else{
                    self.arrayMsg.append(naredel)
                }
            }
            DispatchQueue.main.async {
                self.TableView.reloadData()
                self.LankView.isHidden = self.arrayMsg.count > 0 ? true : false
            }
        }
    }
}
extension TaleMessageController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayUser.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleMessageColl.self, for: indexPath)
        coll.model = self.arrayUser[indexPath.item]
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TaleAnotherpersonController()
        vc.model = self.arrayUser[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
extension TaleMessageController:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayMsg.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleMessageCell.self, for: indexPath)
        cell.model = self.arrayMsg[indexPath.item]
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mdl = self.arrayMsg[indexPath.item]
        if let userData = UserDefaults.standard.object(forKey: "TaleoopUserID:\(mdl.targetId)") {
                        
            let midel = TaleGenModel(userData)
            RCCoreClient.shared().clearMessagesUnreadStatus(.ConversationType_PRIVATE, targetId: "\(mdl.targetId)") { IsTrue in}
            let vc = TaleMessageDialogueController()
            vc.model = midel
            self.navigationController?.pushViewController(vc, animated: true)
                        
        }
    }
}
