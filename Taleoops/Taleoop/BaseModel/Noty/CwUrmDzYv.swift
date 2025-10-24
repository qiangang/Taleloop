
import UIKit
import TTLBGenerals

class CwUrmDzYv: UIView {
        
    var tMenuSession: UIView!
    var aCleverMerge: UIImageView!
    var yAppendingKey: UILabel!
    var gPressedData: UILabel!
    var jRedUniform: UIButton!
        
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setGAddedPairs()
        let kInitialUrl = UIPanGestureRecognizer(target: self, action: #selector(shadowOffsetAnimation(_:)))
        self.addGestureRecognizer(kInitialUrl)
    }
        
    @objc func shadowOffsetAnimation(_ gesture: UIPanGestureRecognizer) {
        if gesture.state == .ended {
            deviceTransferServiceDidStartTransfer()
        }
    }
    func setGAddedPairs() {
        tMenuSession = UIView()
        tMenuSession.frame = CGRectMake(12, UIDevice.addPropertyMapping() + 10, UIScreen.main.bounds.width - 24, 68)
        self.addSubview(tMenuSession)
                
        let cKoinDeclaration = UIImageView()
        cKoinDeclaration.wRefreshFeed = "prenotato_pdisp_workarounds"
        cKoinDeclaration.contentMode = .scaleAspectFill
        cKoinDeclaration.frame = CGRectMake(0, 0, UIScreen.main.bounds.width - 24, 68)
        tMenuSession.insertSubview(cKoinDeclaration, at: 0)
                
        aCleverMerge = UIImageView()
        aCleverMerge.layer.cornerRadius = 28
        aCleverMerge.layer.borderWidth = 1.5
        aCleverMerge.layer.borderColor = UIColor.white.cgColor
        aCleverMerge.clipsToBounds = true
        aCleverMerge.contentMode = .scaleAspectFill
        aCleverMerge.frame = CGRectMake(10, 6, 56, 56)
        tMenuSession.addSubview(aCleverMerge)
        aCleverMerge.recipientStateForAddress("", 80)
                
        jRedUniform = UIButton()
        jRedUniform.wRefreshFeed = "kaola_til"
        jRedUniform.frame = CGRectMake(aFullIntersection - 36 - 40, 14, 40, 40)
        jRedUniform.bringSubviewToFront(jRedUniform.imageView!)
        tMenuSession.addSubview(jRedUniform)
                
                
        yAppendingKey = UILabel()
        yAppendingKey.textColor = showAllEditors("FFFFFF")
        yAppendingKey.font = .boldSystemFont(ofSize: 16.0)
        yAppendingKey.frame = CGRectMake(80, 15, jRedUniform.x - 92, 19)
        tMenuSession.addSubview(yAppendingKey)
                
        gPressedData = UILabel()
        gPressedData.textColor = showAllEditors("A2A2A2")
        gPressedData.font = .systemFont(ofSize: 13.0, weight: .medium)
        gPressedData.frame = CGRectMake(80, 40, jRedUniform.x - 92, 17)
        tMenuSession.addSubview(gPressedData)
                
        tryRunWithVideoView()
    }
    func tryRunWithVideoView() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                var bClientThread = self.frame
                bClientThread.origin.y = 0
                self.frame = bClientThread
            } completion: { [weak self] (finished) in
                guard let self = self else {return}
                self.perform(#selector(self.deviceTransferServiceDidStartTransfer), with: self, afterDelay: 3)
            }
        }
    }
    @objc func deviceTransferServiceDidStartTransfer() {
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.25) { [weak self] in
                guard let self = self else {return}
                var bClientThread = self.frame
                bClientThread.origin.y = -bClientThread.size.width
                self.frame = bClientThread
            } completion: { [weak self] (finished) in
                guard let self = self else {return}
                self.removeFromSuperview()
            }
        }
    }
    required init?(coder: NSCoder) {
        fatalError("")
    }
        
}

