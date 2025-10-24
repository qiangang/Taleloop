
import UIKit

class TaleMyLikeController: BaseController {
    internal var UserID : Int = 0
    private var dataArray = [TaleBeModel]()

    @IBOutlet weak var Layout: WaterfallMutiSectionFlowLayout!{
        didSet {
            self.Layout.delegate = self
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleMyLikeColl.self])
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        self.NameTitle.text = "My like"
        self.CollectionsView.addSubview(self.LankView)
        self.LankView.snp.makeConstraints { make in
            make.center.equalTo(self.CollectionsView)
        }
        self.LankView.isHidden = true

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.requestDefinitionCall()
    }
  
    private func requestDefinitionCall(){
        if self.dataArray.count == 0 {
            ShowLoad()
        }
        GetDefinitionBlock(["tailgunning":"Story Posts"]) { armonica, success in
            HideLoad()
            if success {
                self.dataArray.removeAll()
                let ardol = TaleBeListModel(armonica)
                                
                for madel  in ardol.armonica ?? []{
                    for mdl in madel.fatalistic ?? []{
                        if mdl.chylomicron == self.UserID {
                            self.dataArray.append(madel)
                        }
                    }
                }
                self.LankView.isHidden = self.dataArray.count > 0 ? true : false
                self.CollectionsView.reloadData()
            }
        }
                
    }
}
extension TaleMyLikeController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,WaterfallMutiSectionDelegate {
          
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.dataArray.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleMyLikeColl.self, for: indexPath)
        cell.model = self.dataArray[indexPath.item]
        return cell
    }
        
    func heightForRowAtIndexPath(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, indexPath: IndexPath, itemWidth: CGFloat) -> CGFloat {
        return 179
    }
        
    func columnNumber(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> Int {
        return 3
    }
    func insetForSection(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> UIEdgeInsets {
        .init(top: 40, left: 20, bottom: 0, right: 20)
    }
        
        
    func lineSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 17
    }
        
    func interitemSpacing(collectionView collection: UICollectionView, layout: WaterfallMutiSectionFlowLayout, section: Int) -> CGFloat {
        return 17
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = TaleDiscoverDetailController()
        vc.model = self.dataArray[indexPath.item]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
