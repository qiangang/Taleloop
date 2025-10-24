
import UIKit

class BaseNavController: UINavigationController {
    private var isPush: Bool = false
    private var isBlock: Bool = false
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
                
        self.interactivePopGestureRecognizer?.delegate = self
    }
        
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
                
    }
        
    override var childForStatusBarStyle: UIViewController? {
        return self.topViewController
    }
        
        
    private func sendAlphaViewToBack() {
    }
    internal func updateNavigationView(){
        if self.topViewController?.isKind(of: BaseController.self) == true {
            let v = self.topViewController! as! BaseController
                        
            isBlock = v.IsReturn
            self.setNavigationBarHidden(true, animated: true)
            sendAlphaViewToBack()
        }
    }
        
        
}
extension BaseNavController:UINavigationControllerDelegate{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
                                
        isPush = true
        viewController.hidesBottomBarWhenPushed = self.viewControllers.count > 0 ? true : false
        super.pushViewController(viewController, animated: animated)
    }
    internal func navigationController(_ navigationController: UINavigationController, willShow viewController: UIViewController, animated: Bool){
        if viewController is BaseController{
            if let vc = viewController as? BaseController{
                                
                navigationController.setNavigationBarHidden(true, animated: animated)
                isBlock = vc.IsReturn
                                
                if animated{
                    UIView.animate(withDuration: 0.35) {
                        self.sendAlphaViewToBack()
                    }
                }else{
                    self.sendAlphaViewToBack()
                }
            }
        }
    }
        
        
        
    internal func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
                
        isPush = false
    }
        
}
extension BaseNavController:UIGestureRecognizerDelegate{
        
    internal func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
