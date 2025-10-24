
import UIKit
import Photos.PHAsset
import PhotosUI

class TaleNewsReleaseController: BaseController {
    var callModel:syntonyModelBlock?
    let semaphore=DispatchSemaphore(value:1)
        
    internal var tailgunningName:String = "Story Posts"
    private var arrayIage = [UIImage]()
    @IBOutlet weak var sableTextField: UITextField!
    @IBOutlet weak var LogsTextView: UITextView!{
        didSet {
            self.LogsTextView.tintColor = isColors(0xEC9860)
            self.LogsTextView.delegate = self
        }
    }
    @IBOutlet weak var EntelTipsLabel: UILabel!
        
        
    @IBOutlet weak var CollextionsView: UICollectionView!{
        didSet {
            self.CollextionsView.AddRegisterCell([TaleTaleNewsReleaseColl.self])
        }
    }
    @IBOutlet weak var CollectionLayout: UICollectionViewFlowLayout!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.NameTitle.text = "Release"
    }
    private func  requestFrog(_ array :@escaping(_ array : [String]) -> Void){
        var arrayUrl = [String]()
        let curQueue = DispatchQueue(label: "curQueue")
                
        ShowLoad()
        curQueue.async { [self] in
            for im in self.arrayIage {
                self.semaphore.wait()
                requestWeekAlternativeWithBlock(1, [im]) { res, status in
                    self.semaphore.signal()
                    if status {
                        let ardol = TaleMonicaModel(res["armonica"] as Any)
                        arrayUrl.append(ardol.ramiform!)
                        if arrayUrl.count == self.arrayIage.count {
                            HideLoad()
                            array(arrayUrl)
                        }
                    }else{
                        HideLoad()
                    }
                }
            }
        }
                
                
    }
        
    @IBAction func ConfirmBtnAction(_ sender: UIButton) {
        if self.arrayIage.count == 0 {
            showHints("Please select the picture!", {})
            return
        }
        if IsNilStr(self.sableTextField.text){
            showHints("Please enter the title!", {})
            return
        }
        if IsNilStr(self.LogsTextView.text) {
            showHints("Please enter the content!", {})
            return
        }
                
        self.requestFrog { array in
                        
            let ary = [
                "tailgunning":self.tailgunningName,
                "polarisable":self.sableTextField.text!,
                "autoland":self.LogsTextView.text!,
                "stretcher":arrayToStr(array)
            ]
            ShowLoad()
            GetFrogBlock(ary) { armonica, success in
                HideLoad()
                if success {
                    let ardol = TaleBeModel(armonica["armonica"] as Any)
                    self.callModel?(ardol)
                    showHints {
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
                
    }
    private func WeekAlternative(_ mdlUrl :@escaping(_ mdlUrl : TaleMonicaModel) -> Void) {
        ShowLoad()
        requestWeekAlternativeWithBlock(1, self.arrayIage) { res , status in
            HideLoad()
            if status {
                let ardol = TaleMonicaModel(res["armonica"] as Any)
                mdlUrl(ardol)
            }
        }
    }
}
extension TaleNewsReleaseController : UITextViewDelegate {
    internal func textViewDidEndEditing(_ textView: UITextView) {
        self.EntelTipsLabel.isHidden = textView.text.count == 0 ? false:true
    }
    internal func textViewDidChange(_ textView: UITextView) {
        self.EntelTipsLabel.isHidden = textView.text.count > 0 ? true:false
    }
}
extension TaleNewsReleaseController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return min(3,arrayIage.count + 1)
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.AddDequCell(TaleTaleNewsReleaseColl.self, for: indexPath)
        if indexPath.item == self.arrayIage.count {
            cell.BaoJiImg.isHidden = false
            cell.ImgView.image = .init(named: "SelectPhotoIcon")
        }else{
            if self.arrayIage.count > 0 {
                cell.ImgView.image = self.arrayIage[indexPath.item]
                DispatchQueue.main.async {
                    cell.BaoJiImg.isHidden = true
                }
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.item == self.arrayIage.count  {
            UIAlertController.addAlertCtrol(["Camera","Photo album"]) { indexp in
                switch indexp {
                case 0:
                    addSystemAuth(.Camera) {
                        DispatchQueue.main.async {
                            let pickerVC = UIImagePickerController()
                            pickerVC.delegate = self
                            pickerVC.sourceType = .camera
                            pickerVC.modalPresentationStyle = .overCurrentContext
                            self.present(pickerVC, animated: true, completion: nil)
                        }
                    } _: {}
                case 1:
                    addSystemAuth(.PhotoAlbum) {
                        DispatchQueue.main.async {
                            var config = PHPickerConfiguration()
                            config.selectionLimit = min(3,3 - self.arrayIage.count)
                            config.filter =  .images
                            if #available(iOS 15.0, *) {
                                config.selection = .ordered
                            } else {
                            }
                            let vc = PHPickerViewController(configuration: config)
                            vc.delegate = self
                            vc.editButtonItem.tintColor = .orange
                            self.present(vc, animated: true)
                        }
                    } _: {}
                default:
                    break
                }
            }
        }
    }
        
}
extension TaleNewsReleaseController: PHPickerViewControllerDelegate,UIImagePickerControllerDelegate , UINavigationControllerDelegate {
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true)
        for result in results {
            let provider = result.itemProvider
            if provider.canLoadObject(ofClass: UIImage.self) {
                provider.loadObject(ofClass: UIImage.self) { image, error in
                    guard let image = image as? UIImage else { return }
                    self.arrayIage.append(image)
                    DispatchQueue.main.async {
                        self.CollextionsView.reloadData()
                    }
                }
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let asset = info[.phAsset] as? PHAsset {
        }
        picker.dismiss(animated: true, completion: nil)
                
        let image = info[.originalImage] as? UIImage
        self.arrayIage.append(image!)
        DispatchQueue.main.async {
            self.CollextionsView.reloadData()
        }
    }
}
