import UIKit

class CustomShapeView: UIView {
        
    private let concaveHeight: CGFloat = 22.19
    private let concaveCurveFactor: CGFloat = 0.75
        
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
        
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
        
    private func setupView() {
        backgroundColor = .clear
        let shapeLayer = CAShapeLayer()

        layer.mask = shapeLayer 
    }
        
    override func layoutSubviews() {
        super.layoutSubviews()
        updateShapeLayer()
    }
        
    private func updateShapeLayer() {
        let path = createCustomPath()
        if let maskLayer = layer.mask as? CAShapeLayer {
            maskLayer.path = path.cgPath
        } else {
            let shapeLayer = CAShapeLayer()

            shapeLayer.path = path.cgPath
            shapeLayer.strokeColor = isColors(0xCD873C).cgColor 
            shapeLayer.fillColor = UIColor.yellow.cgColor 
            shapeLayer.lineWidth = 2.0 
            shapeLayer.lineJoin = .round 
                        
            layer.addSublayer(shapeLayer) 
        }
    }
        
    private func createCustomPath() -> UIBezierPath {
        let path = UIBezierPath()
        let width = bounds.width
        let height = bounds.height
        let middleY = self.height - 40
                
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: width, y: 0))
        let rightConcaveStart = CGPoint(x: width, y: middleY - concaveHeight / 2)
        path.addLine(to: rightConcaveStart)
        let rightConcaveEnd = CGPoint(x: width, y: middleY + concaveHeight / 2)
        let rightControlPoint1 = CGPoint(x: width - concaveHeight * concaveCurveFactor, y: middleY - concaveHeight / 2)
        let rightControlPoint2 = CGPoint(x: width - concaveHeight * concaveCurveFactor, y: middleY + concaveHeight / 2)
        path.addCurve(to: rightConcaveEnd, controlPoint1: rightControlPoint1, controlPoint2: rightControlPoint2)
        path.addLine(to: CGPoint(x: width, y: height))
        path.addLine(to: CGPoint(x: 0, y: height))
        let leftConcaveStart = CGPoint(x: 0, y: middleY + concaveHeight / 2)
        path.addLine(to: leftConcaveStart)
        let leftConcaveEnd = CGPoint(x: 0, y: middleY - concaveHeight / 2)
        let leftControlPoint1 = CGPoint(x: concaveHeight * concaveCurveFactor, y: middleY + concaveHeight / 2)
        let leftControlPoint2 = CGPoint(x: concaveHeight * concaveCurveFactor, y: middleY - concaveHeight / 2)
        path.addCurve(to: leftConcaveEnd, controlPoint1: leftControlPoint1, controlPoint2: leftControlPoint2)
        path.close()
                
        return path
    }
}
