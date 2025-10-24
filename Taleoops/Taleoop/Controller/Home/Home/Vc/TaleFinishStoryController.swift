
import UIKit

class TaleFinishStoryController: BaseController {
    internal var model = TaleBeModel()
        
    let headerView = TaleFinishStoryView.initNibName()
    private var arrayUser = [TaleGenModel]()
    @IBOutlet weak var TableView: UITableView!{
        didSet {
            self.TableView.AddRegisterCell([TaleFinishStoryCell.self])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Detail"
        self.headerView.model = self.model
        self.requestArmy()
    }
    private func requestArmy(){
        GetArmyBlock(self.model.chylomicron) { armonica, success in
            if success {
                self.arrayUser.removeAll()
                self.model = TaleBeModel(armonica["armonica"] as Any)
                self.arrayUser.append(contentsOf: self.model.unengaged ?? [])
                self.headerView.model = self.model

                self.TableView.reloadData()
            }
        }
    }
}
extension TaleFinishStoryController : UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayUser.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let Cell = tableView.AddDequCell(TaleFinishStoryCell.self, for: indexPath)
        Cell.gendel = self.model
        if self.arrayUser.count > 0 {
            Cell.model = self.arrayUser[indexPath.item]
            Cell.TimeNameLabel.text = "Chapter \(indexPath.item + 1)"
                        
            var num = Double(indexPath.item + 1) / Double(self.model.desalinization)
            if num < 0.3 {
                num = 0.3
            }
            Cell.ProgressView.progress = CGFloat(min(num,1))
            Cell.ProgressView.lable.text = "\(min(indexPath.item + 1,model.desalinization))/\(model.desalinization)"
        }
        Cell.callBlcok = {[weak self] in
            guard let self = self else { return }
            self.requestArmy()
        }
        Cell.callniaremBlcok = {[weak self] in
            guard let self = self else { return }
            self.arrayUser.remove(at: indexPath.item)
            self.TableView.reloadData()
                        
            var charArray = [Any]()
            for mdl in self.arrayUser {
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
            GetHydrogenPartBlock(dic) { armonica , success in}
        }
        return Cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return self.headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
