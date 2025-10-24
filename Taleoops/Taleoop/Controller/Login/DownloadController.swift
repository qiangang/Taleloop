//
//  DownloadController.swift
//  Taleoop
//
//  Created by Ben on 10/17/25.
//

import UIKit
import SSZipArchive
import Alamofire 

class DownloadController: UIViewController {

    @IBOutlet weak var progressView: GradProgressView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        progressView.showAllEditors = [isColors(0xF7BF49),isColors(0xF7BF49)]
        authErrorLogout()
    }
    private func authErrorLogout() {
        cachedDevMenuScreens(DownloadICONSURL) { res in
            self.progressLabel.text = String(format: "%.2f%%", res * 100)
            self.progressView.symSharpEmojiSymbols = res
            self.progressView.layoutIfNeeded()
        } suc: {[weak self] res in
            guard let self = self else {return}
            let nConstructDate = NSHomeDirectory().appending("/Library/")
            SSZipArchive.unzipFile(atPath: res, toDestination: nConstructDate)

            AppDelegas.UserTabbarHome()
        } fail: { res in
            AppDelegas.UserLogin()
        }
    }
    
    
    
    
        private func cachedDevMenuScreens(_ urlStr : String,_ gress:@escaping (_ req : Double)->Void, suc:@escaping (_ req : String)->Void, fail:@escaping (_ msg : String)->Void) {
        if urlStr.count == 0 {
            fail("")
            return
        }
        let destination = DownloadRequest.suggestedDownloadDestination(for: .cachesDirectory)
        let url = URL(string: urlStr as String)!
        let urls = URLRequest(url: url)
        
        let pathway = NSHomeDirectory().appending("/Library/Caches/") + url.lastPathComponent
        let manager = FileManager()
        if !manager.fileExists(atPath: pathway) {
            AF.download(urls,to: destination).downloadProgress { progress in
                let gressed = Double(progress.fractionCompleted)
                gress(gressed)
            }.response { response in
                switch response.result {
                case .success(_):
                    let xFromBranch = NSHomeDirectory() + "/Library/Caches/" + urls.url!.lastPathComponent
                    suc(xFromBranch)
                case .failure(_):
                    fail("")
                }
            }
            
        }else{
            suc(pathway)
        }
    }
}
