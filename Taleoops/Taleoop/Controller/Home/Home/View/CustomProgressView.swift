
import UIKit

class CustomProgressView: UIView {
    let lable = UILabel()
        
        
    var progress: CGFloat = 0.0 {
        didSet {
            setNeedsDisplay()
        }
    }
        
        
    var coutLab:Int = 10 {
        didSet{
                        
        }
    }
    var progresWidth : CGFloat = 0
        
    override func draw(_ rect: CGRect) {
        super.draw(rect)
                
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
                
                
        let backgroundPath = UIBezierPath(roundedRect: rect, cornerRadius: rect.height / 2)
        isColors(0xFFDCA3).setFill()
        backgroundPath.fill()
                
                
        let progressWidth = rect.width * CGFloat(progress)
        progresWidth = progressWidth
        let progressRect = CGRect(x: 0, y: 0, width: progressWidth, height: rect.height)
        let progressPath = UIBezierPath(roundedRect: progressRect, cornerRadius: rect.height / 2)
        isColors(0xF7BF49).setFill()
        progressPath.fill()
                
        context?.restoreGState()
                
        lable.removeFromSuperview()
        lable.font = .boldSystemFont(ofSize: 12.0)
        lable.textColor = .white
        self.addSubview(lable)
        lable.frame = .init(x: progresWidth - 27, y: 0, width: 21, height: 15)
    }
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
}
