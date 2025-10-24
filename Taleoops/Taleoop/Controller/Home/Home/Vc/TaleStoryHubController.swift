
import UIKit

class TaleStoryHubController: BaseController {
    private var arrayTool = [TaleBeModel]()
    @IBOutlet weak var Layout: UICollectionViewFlowLayout!{
        didSet {
            self.Layout.itemSize = .init(width: (WIDTH - 39 - 37 - 23) / 2, height: (WIDTH - 39 - 37 - 23) / 2 + 4)
            self.Layout.sectionInset = .init(top: 10, left: 17, bottom: 15, right: 15)
            self.Layout.minimumLineSpacing = 13
            self.Layout.minimumInteritemSpacing = 23
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleStoryHubColl.self])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.NameTitle.text = "Story Hub"
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestDefinitionCall()

    }
    @IBAction func RandomBtnAction(_ sender: UIButton) {
        if self.arrayTool.count == 0 {
            return
        }
        let randomInt = Int.random(in: 0..<self.arrayTool.count)
        let vc = TaleStoryRoomController()
        vc.mdl = self.arrayTool[randomInt]
        self.navigationController?.pushViewController(vc, animated: true)
        vc.classMdl = {[weak self] mdls in
            guard let self = self else { return }
            self.arrayTool.remove(at: randomInt)
        }
    }
        
    @IBAction func CreateBtnAction(_ sender: UIButton) {
        let vc = TaleCreateRoomController()
        self.navigationController?.pushViewController(vc, animated: true)
        vc.GetMdlBlock = {[weak self] mdl in
            guard let self = self else { return }
            self.arrayTool.insert(mdl, at: 0)
            self.CollectionsView.reloadData()
        }
    }
    private func requestDefinitionCall(){
        if self.arrayTool.count == 0 {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":"StoryHubStr"]) { armonica, success in
            HideLoad()
            if success {
                self.arrayTool.removeAll()
                let ardol = TaleBeListModel(armonica)
                self.arrayTool.append(contentsOf: ardol.armonica ?? [])
                self.CollectionsView.reloadData()
            }
        }
    }
        
}
extension TaleStoryHubController: UICollectionViewDelegate,UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.arrayTool.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleStoryHubColl.self, for: indexPath)
        coll.model = self.arrayTool[indexPath.item]
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TaleStoryRoomController()
        vc.mdl = self.arrayTool[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
        vc.classMdl = {[weak self] msl in
            guard let self = self else { return }
            self.arrayTool.remove(at: indexPath.item)
            self.CollectionsView.reloadData()
        }
    }
        
}
