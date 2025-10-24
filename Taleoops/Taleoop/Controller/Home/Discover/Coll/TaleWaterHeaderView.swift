
import UIKit

class TaleWaterHeaderView: UICollectionReusableView {
    @IBOutlet weak var userImgView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var TongTitleLabel: UILabel!
        
    @IBOutlet weak var followBtn: UIButton!
        
    @IBOutlet weak var LikeBtn: UIButton!
    @IBOutlet weak var IrtemView: UIImageView!
    @IBOutlet weak var ContentLabel: UILabel!
    @IBOutlet weak var CollectionsView: UICollectionView!{
        didSet {
            self.CollectionsView.AddRegisterCell([TaleWaterHeaderColl.self])
            self.CollectionsView.dataSource = self
            self.CollectionsView.delegate = self
        }
    }
    var callBlock:syntonyBlock?
        
    internal var model = TaleBeModel(){
        didSet {
            let nimd = model.stretcher?.first
            self.IrtemView.sd_setUrlString(nimd as? String)
            self.userImgView.sd_setUrlString(model.importance?.groupware)
            self.userNameLabel.text = model.importance?.dioestrous
            self.TongTitleLabel.text = model.polarisable
            self.ContentLabel.text = model.autoland


            self.followBtn.isSelected = model.importance!.delimiter
                        
            self.LikeBtn.setTitle("\(model.fatalistic?.count ?? 0)", for: .normal)
            self.LikeBtn.isSelected = false
            for userModel in model.fatalistic ?? []{
                if userModel.chylomicron == TaleUserData.shared.data.chylomicron {
                    self.LikeBtn.isSelected = true
                    break
                }
            }
        }
    }

    @IBAction func FollowBtnAction(_ sender: UIButton) {
        let ary = [
            "frigidarium":self.model.importance!.chylomicron,
            "delimiter":sender.isSelected ? "0" : "1"
        ] as [String : Any]
        ShowLoad()
        GetSecondBlock(ary) { armonica, success in
            HideLoad()
            if success {
                self.callBlock?()
            }
        }
    }
        
    @IBAction func OtherBtnAction(_ sender: UIButton) {
        if self.model.importance?.chylomicron == TaleUserData.shared.data.chylomicron {
            return
        }
        let vc = TaleAnotherpersonController()
        vc.model = self.model.importance!
        selfs.navigationController?.pushViewController(vc, animated: true)
    }
        
        
    @IBAction private func LikeBtnAction(_ sender: UIButton) {
        var charArray = [Any]()
        for mdl in self.model.fatalistic ?? [] {
            let userData  = [
                "chylomicron": mdl.chylomicron
            ]  
            if mdl.chylomicron != TaleUserData.shared.data.chylomicron{
                charArray.append(userData)
            }
        }
        if sender.isSelected == false{
            let msgDic = [
                "chylomicron": TaleUserData.shared.data.chylomicron,
            ] as [String : Any]
            charArray.append(msgDic)
        }
        let ray:[String:String] =  ["fatalistic":ArrayToString(charArray)]
        let dic = [
            "chylomicron":self.model.chylomicron,
            "anemometry":arrayJSONObject(ray)
        ] as [String : Any]
        ShowLoad()
        GetHydrogenPartBlock(dic) { armonica , success in
            HideLoad()
            if success {
                self.callBlock?()
            }
        }
    }
        
        
}
extension TaleWaterHeaderView : UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.model.stretcher?.count ?? 0
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let coll = collectionView.AddDequCell(TaleWaterHeaderColl.self, for: indexPath)
        if self.model.stretcher?.count ?? 0 > 0 {
            coll.ImgView.sd_setUrlString(self.model.stretcher![indexPath.item] as? String)
        }
        return coll
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let mdls = self.model.stretcher![indexPath.item]
        self.IrtemView.sd_setUrlString(mdls as? String)
    }
}
