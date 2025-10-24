
import UIKit
import MJRefresh

class TaleStoryLibraryController: BaseController {
    private var arrayOng = [TaleBeModel]()
        
    private var selectIndex:Int = 1
    @IBOutlet weak var OngoingBtn: UIButton!
    @IBOutlet weak var OngoingLab: UILabel!{
        didSet {
            let attrString = NSMutableAttributedString(string: self.OngoingLab.text!)
            let attr: [NSAttributedString.Key : Any] = [
                .font: UIFont.init(name: "Inter-ExtraBold", size: 16.0)!,
                .foregroundColor: UIColor(red: 1, green: 0.86, blue: 0.64, alpha: 1),
                .strokeColor: UIColor(red: 0.8,green: 0.53,blue: 0.24,alpha: 1),
                .strokeWidth: -6]
            attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
            OngoingLab.attributedText = attrString
        }
    }
        
    @IBOutlet weak var CompletedBtn: UIButton!
    @IBOutlet weak var CompletedLab: UILabel!{
        didSet {
            let attrString = NSMutableAttributedString(string: self.CompletedLab.text!)
            let attr: [NSAttributedString.Key : Any] = [
                .font: UIFont.init(name: "Inter-ExtraBold", size: 16.0)!,
                .foregroundColor: UIColor(red: 1, green: 0.86, blue: 0.64, alpha: 1),
                .strokeColor: UIColor(red: 0.8,green: 0.53,blue: 0.24,alpha: 1),
                .strokeWidth: -6]
            attrString.addAttributes(attr, range: NSRange(location: 0, length: attrString.length))
            CompletedLab.attributedText = attrString
        }
    }
    @IBOutlet weak var Layout: UICollectionViewFlowLayout!{
        didSet {
            self.Layout.itemSize = .init(width: (WIDTH - 40 - 25) / 2, height:  (WIDTH - 40 - 25) / 2 + 60.85)
            self.Layout.minimumLineSpacing = 25
            self.Layout.minimumInteritemSpacing = 12
            self.Layout.sectionInset = .init(top: 8, left: 20, bottom: 0, right: 20)
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleStoryLibraryCell.self])
        }
    }
        
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Story Library"
        self.OngoingLab.textColor = .white
        self.CompletedLab.textColor = isColors(0xFFDCA3)

        self.CollectionsView.mj_header = .init(refreshingBlock: { [weak self] in
            guard let self = self else { return }
            self.StoryLibrCall()
        })
     }
        
    @IBAction func SeleBtnClick(_ sender: UIButton) {
        if sender.tag == 1 {
            self.OngoingLab.textColor = .white
            self.CompletedLab.textColor = isColors(0xFFDCA3)
        }else if sender.tag == 2 {
            self.CompletedLab.textColor = .white
            self.OngoingLab.textColor = isColors(0xFFDCA3)
         }
        self.selectIndex = sender.tag
        self.SelectMeans(sender.tag)
    }
    private func SelectMeans(_ idx:Int){
                
        self.StoryLibrCall()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.StoryLibrCall()
    }
    private func StoryLibrCall(){
        if self.arrayOng.count == 0 {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":"StoryLibraryStr","copilot":1]) { armonica, success in
            HideLoad()
            if success {
                self.arrayOng.removeAll()
                let ardol = TaleBeListModel(armonica)
                for mdl in ardol.armonica ?? [] {
                    if self.selectIndex == 1 {
                        if mdl.unengaged!.count < mdl.desalinization  {
                            self.arrayOng.append(mdl)
                        }
                    }else if self.selectIndex == 2 {
                        if mdl.unengaged!.count >= mdl.desalinization {
                            self.arrayOng.append(mdl)
                        }
                    }
                }
                self.CollectionsView.mj_header?.endRefreshing()
                self.CollectionsView.reloadData()
            }
        }
    }
}
extension TaleStoryLibraryController:UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayOng.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleStoryLibraryCell.self, for: indexPath)
        coll.model = self.arrayOng[indexPath.item]
                
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if self.selectIndex == 1 {
            let vc = TaleStoryProgressController()
            vc.model = self.arrayOng[indexPath.item]
            self.navigationController?.pushViewController(vc, animated: true)
        }else if self.selectIndex == 2 {
            let vc = TaleFinishStoryController()
            vc.model = self.arrayOng[indexPath.item]
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
