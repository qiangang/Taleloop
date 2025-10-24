
import UIKit

class ChapterRemoveView: UIView {
        
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var bgView: UIView!
        
    @IBOutlet weak var topHeight: NSLayoutConstraint!
        
    @IBOutlet weak var TopView: UIView!
    var syntonyBlock:syntonyBlock?
    var userID : Int = 0
        
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundView.addGestureClick { [weak self] ges in
            guard let `self` = self else {
                return
            }
            popHide()
        }
        width  = WIDTH
        height = HEIGHT
                
        topHeight.constant = HEIGHT
                
                
        self.alpha = 0
                
        let size = ContentSize(bgView)
        UIView.animate(withDuration: 0.25) {
            self.alpha = 1
            self.backgroundColor = isColors(0x000000).withAlphaComponent(0.4)
            self.bgView.transform = .init(translationX: 0, y: -size.height)
        }
                
        Windows.addSubview(self.TopView)
        self.TopView.snp.makeConstraints { make in
            make.top.left.right.equalTo(0)
            make.height.equalTo(StatusBarHei + NavigationHeight)
        }
        self.TopView.backgroundColor = isColors(0x000000).withAlphaComponent(0.05)
    }
        
    @IBAction func DeleteBtnAction(_ sender: UIButton) {
        self.syntonyBlock?()
        self.popHide()
    }
        
    @IBAction func cancelBtnClick(_ sender: UIButton) {
        popHide()
    }
        
    internal func popHide(){
        UIView.animate(withDuration: 0.25) {
            if self.TopView != nil {
                self.TopView.removeFromSuperview()
            }
            self.bgView.transform = .identity
            self.alpha = 0
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.25) {
                self.removeFromSuperview()
            }
        }
    }
}
