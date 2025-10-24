
import UIKit
import IQKeyboardManagerSwift

class TaleReportController: BaseController {
    var userID:Int = 0
    let headerView = UIView()
        
    private var selectIndex : Int = -1
    let btmView = TaleBtmView.initNibName()
    let arrayStr = ["Political Sensitive","Violent Pornography","Advertising Harassment","Infringement"]
    @IBOutlet weak var TabelView: UITableView!{
        didSet {
            self.TabelView.AddRegisterCell([TaleReportCell.self])
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Report"
        IQKeyboardManager.shared.isEnabled = true
    }
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        self.armon()
    }
    private func armon(){
        ShowLoad()
        GetSpontaneousBlock(userID) { armonica, success in
            HideLoad()
            if success {
                showHints {
                    self.navigationController?.popToRootViewController(animated: true)
                }
            }
        }
    }
}
extension TaleReportController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.arrayStr.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.AddDequCell(TaleReportCell.self, for: indexPath)
        cell.NameLab.text = self.arrayStr[indexPath.item]
        if indexPath.item == 0 {
            cell.BgView.backgroundColor = isColors(0xF19A6F)
        }else if indexPath.item == 1 {
            cell.BgView.backgroundColor = isColors(0xA5D44D)
        }else if indexPath.item == 2 {
            cell.BgView.backgroundColor = isColors(0xA4E4E7)
        }else if indexPath.item == 3 {
            cell.BgView.backgroundColor = isColors(0xE7A4E0)
        }
        if indexPath.item == self.selectIndex {
            cell.MreView.layer.borderWidth = 2
        }else{
            cell.MreView.layer.borderWidth = 0
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectIndex = indexPath.item
                
        self.TabelView.reloadData()
    }
        
    internal func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    internal func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.01
    }
        
    internal func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return self.btmView
    }
    internal func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        UITableView.automaticDimension
    }
}
