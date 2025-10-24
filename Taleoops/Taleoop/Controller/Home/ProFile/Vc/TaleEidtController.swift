
import UIKit

class TaleEidtController: BaseController {
        
    @IBOutlet weak var GroupwareImgView: UIImageView!
        
    @IBOutlet weak var DioestrousTfd: UITextField!
        
    private var groupwareUrl:String?
        
    override func viewDidLoad() {
        super.viewDidLoad()
                
        self.NameTitle.text = "Eidt"
                
        self.GroupwareImgView.sd_setUrlString(TaleUserData.shared.data.groupware)
        self.DioestrousTfd.text = TaleUserData.shared.data.dioestrous
                
        self.groupwareUrl = TaleUserData.shared.data.groupware
    }
        
    @IBAction func SelectBtnPhoto(_ sender: UIButton) {
        UIAlertController.addAlertCtrol(["Camera","Photo album"]) { index in
            if index == 0 {
                addSystemAuth(.Camera) {
                    DispatchQueue.main.async {
                        let pickerVC = UIImagePickerController()
                        pickerVC.delegate = self
                        pickerVC.sourceType = .camera
                        pickerVC.modalPresentationStyle = .overCurrentContext
                        self.present(pickerVC, animated: true, completion: nil)
                    }
                } _: {}
                                
            }else if index == 1 {
                addSystemAuth(.PhotoAlbum) {
                    DispatchQueue.main.async {
                        let pickerVC = UIImagePickerController()
                        pickerVC.delegate = self
                        pickerVC.modalPresentationStyle = .overCurrentContext
                        self.present(pickerVC, animated: true, completion: nil)
                    }
                } _: {}
            }
        }
    }
        
        
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        let dic = [
            "groupware":TaleUserData.shared.data.groupware!,
            "dioestrous":self.DioestrousTfd.text!
        ]
        TaleUserData.shared.data.dioestrous = self.DioestrousTfd.text
        SaveDataInfo(TaleUserData.shared.data)
        ShowLoad()
        GetUpperBlock(dic as [String : Any]) { armonica, success in
            HideLoad()
            if success {
                showHints {
                    self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }
}
extension TaleEidtController: UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    internal func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
                
        let image = info[.originalImage] as? UIImage
        self.GroupwareImgView.image = image
                
        DispatchQueue.main.async {
            requestWeekAlternativeWithBlock(1, [image!]) { res, status in
                if status {
                    let ardol = TaleMonicaModel(res["armonica"] as Any)
                    TaleUserData.shared.data.groupware = ardol.ramiform
                }
            }
        }
    }
}
