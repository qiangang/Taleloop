
import UIKit

class TaleDiscoverTopicCell: UITableViewCell {
        
    var dataSource = [TaleBeModel](){
        didSet {
            self.CollectionsView.reloadData()
        }
    }
        
    @IBOutlet weak var CollectionsLayout: TaleWaterfallFlowLayout!{
        didSet{
            CollectionsLayout.scrollDirection = .horizontal
            CollectionsLayout.minimumInteritemSpacing = 16
            CollectionsLayout.minimumLineSpacing = 10
            CollectionsLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleTaleDiscoverTopicColl.self])
            self.CollectionsView.delegate = self
            self.CollectionsView.dataSource = self
        }
    }
        
        
    var displayLink: CADisplayLink!
    var position: CGFloat = 0.0
        
        
    @IBOutlet weak var WayTickeImgView: UIImageView!
        
    @IBOutlet weak var TickeView: UIView!
        
    @IBOutlet weak var BarrageView: UIView!
        
    @IBOutlet weak var StaticView: UIView!
    @IBOutlet weak var StaticImgView: UIImageView!
        
    @IBOutlet weak var DoorImgView: UIImageView!
    @IBOutlet weak var DoorView: UIView!
        
        
    override func awakeFromNib() {
        super.awakeFromNib()
                
                
        DispatchQueue.main.async {
            self.TickeView.layoutIfNeeded()
            self.StaticView.layoutIfNeeded()
            self.DoorView.layoutIfNeeded()
                        
            self.TickeView.addLightColor(.Top, [isColors(0xCD873C).withAlphaComponent(0.0).cgColor,isColors(0xF7BF49).withAlphaComponent(1.0).cgColor])
                        
            self.StaticView.addLightColor(.Top, [isColors(0xCD873C).withAlphaComponent(0.0).cgColor,isColors(0xF7BF49).withAlphaComponent(1.0).cgColor])
            self.DoorView.addLightColor(.Top, [isColors(0xCD873C).withAlphaComponent(0.0).cgColor,isColors(0xF7BF49).withAlphaComponent(1.0).cgColor])
                        
        }
        DispatchQueue.main.async {
            self.BarrageView.layoutIfNeeded()
            self.BarrageView.swiftDrawBoardDottedLine(width: 15, lenth: 5, space: 3, cornerRadius: 15, color: isColors(0xF7BF49))
        }
                
    }
        
        
        
        
        
        
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
                
    }
        
    @IBAction func TickeBtnAction(_ sender: UIButton) {
        let vc = TaleHotPostController()
                
        if sender.tag == 1 {
            vc.titleLabel = "# One-Way Ticke"
            vc.nameImgStr = "TickeIcon"
        }else if sender.tag == 2 {
            vc.titleLabel = "# Voice in the Static"
            vc.nameImgStr = "StaticICon"
        }else if sender.tag == 3 {
            vc.titleLabel = "# The Hidden Door"
            vc.nameImgStr = "DoorICon"
        }
                
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
    @IBAction func ReleaseBtnAction(_ sender: UIButton) {
        let mreView = TaleReleaseBulletScreenView.initNibName()
        Windows.addSubview(mreView)
        mreView.StringBlock = {[weak self] str in
            guard let self = self else { return }
            let dic = [
                "tailgunning":"Floatingrice",
                "polarisable":str
            ]
            ShowLoad()
            GetFrogBlock(dic) { armonica, success in
                HideLoad()
                if success {
                    let ardel = TaleBeModel(armonica["armonica"] as Any)
                    self.dataSource.append(ardel)
                    self.CollectionsView.reloadData()
                }
            }
        }
    }
}

extension TaleDiscoverTopicCell : UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleTaleDiscoverTopicColl.self, for: indexPath)
        cell.model = self.dataSource[indexPath.item]
        cell.callModel = {[weak self] mdl in
            guard let self = self else { return }
            self.dataSource.remove(at: indexPath.item)
            self.CollectionsView.reloadData()
        }
        return cell
    }
}
