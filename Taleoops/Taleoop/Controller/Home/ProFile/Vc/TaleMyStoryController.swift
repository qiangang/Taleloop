
import UIKit

class TaleMyStoryController: BaseController {
    internal var UserID : Int = 0

    private var dataArray = [TaleBeModel]()
    @IBOutlet weak var Layout: WaterfallMutiSectionFlowLayout!{
        didSet {
            self.Layout.delegate = self
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleStoryLibraryCell.self])
        }
    }
        
    override func viewDidLoad() {
        super.viewDidLoad()

        self.NameTitle.text = "My story"
        self.CollectionsView.addSubview(self.LankView)
        self.LankView.snp.makeConstraints { make in
            make.center.equalTo(self.CollectionsView)
        }
        self.LankView.isHidden = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.StoryLibrCall()
    }
    private func StoryLibrCall(){
        ShowLoad()
        GetDefinitionBlock(["tailgunning":"StoryLibraryStr","copilot":2,"frigidarium":UserID]) { armonica, success in
            HideLoad()
            if success {
                self.dataArray.removeAll()
                let ardol = TaleBeListModel(armonica)
                for mdl in ardol.armonica ?? [] {
                    if mdl.importance?.chylomicron == TaleUserData.shared.data.chylomicron{
                        self.dataArray.append(mdl)
                    }
                }
                self.LankView.isHidden = self.dataArray.count > 0 ? true : false
                self.CollectionsView.reloadData()
            }
        }
    }
}
extension TaleMyStoryController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,WaterfallMutiSectionDelegate {
          
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataArray.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleStoryLibraryCell.self, for: indexPath)
        cell.HotImgView.isHidden = true
        cell.model = self.dataArray[indexPath.item]
        return cell
    }
        
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return 20 + 168.53
    }
        
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 2
    }
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 20, left: 20, bottom: 0, right: 20)
    }
        
        
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 10
    }
        
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 25
    }
        
    func spacingWithLastSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 15
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let mdl = self.dataArray[indexPath.item]
        if mdl.unengaged?.count == mdl.desalinization {
                        
            let vc = TaleFinishStoryController()
            vc.model = mdl
            self.navigationController?.pushViewController(vc, animated: true)
        }else{
            let vc = TaleStoryProgressController()
            vc.model = mdl
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
