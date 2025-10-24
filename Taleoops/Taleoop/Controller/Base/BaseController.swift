
import UIKit

class BaseController: UIViewController {
    let LankView = TaleBlankView.initNibName()
        
    internal var navationColor:UIColor = .clear

        
    internal var IsNaviBool:Bool = true
        
        
    internal var IsReturn:Bool = true
        
    private lazy var navieBackground: UIView = {
        let groundView = UIView()
        return groundView
    }()
    internal lazy var NameTitle: UILabel = {
        let crlaba = UILabel()
        crlaba.font = .init(name: "Bestime", size: 22.0)
        crlaba.textColor = isColors(0xCD873C)
        return crlaba
    }()
    internal lazy var BackBtn: UIButton = {
        let UpsideBtn = UIButton()
        UpsideBtn.addTarget(self, action: #selector(BackBtnItemBtnClick(_ :)), for: .touchUpInside)
        UpsideBtn.setImage(UIImage(named: "UpsideIcon"), for: .normal)
        UpsideBtn.width = NavigationHeight
        UpsideBtn.height = NavigationHeight
        UpsideBtn.contentHorizontalAlignment = .left
        return UpsideBtn
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: BackBtn)
        self.view.addSubview(navieBackground)
        navieBackground.addSubview(NameTitle)
        NameTitle.snp.makeConstraints { make in
            make.left.right.bottom.top.equalTo(0)
        }
        self.navigationItem.titleView = navieBackground

    }
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .darkContent
     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("---Is: \(String(describing: Self.self)) --" )

    }
    @objc internal func BackBtnItemBtnClick(_ sender:UIButton){
        if self.navigationController?.visibleViewController != nil {
            self.navigationController?.popViewController(animated: true)
        }
        self.dismiss(animated: true)
    }
        
        
}
