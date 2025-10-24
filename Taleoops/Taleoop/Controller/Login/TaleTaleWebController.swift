
import UIKit
import TTLBGenerals
@preconcurrency import WebKit

class TaleTaleWebController: HeTraditionalChineseObject,WKUIDelegate,WKNavigationDelegate {
    var WebTitleName:String?
    var ContentUrl:String?
        
    @IBOutlet weak var ProgView: UIProgressView!
    @IBOutlet weak var TaleWebView: WKWebView!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.canBeWrittenToCache.setImage(UIImage(named: "UpsideIcon"), for: .normal)
        self.segmentZeroFrames.text = self.WebTitleName
        TaleWebView.load(.init(url: URL(string: self.ContentUrl!)!))
        TaleWebView.navigationDelegate = self
        TaleWebView.uiDelegate = self
        TaleWebView.isOpaque = false
        TaleWebView.scrollView.backgroundColor = .clear
        TaleWebView.translatesAutoresizingMaskIntoConstraints = false
        TaleWebView.translatesAutoresizingMaskIntoConstraints = false
    }
  
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        self.ProgView.isHidden = false
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        decisionHandler(.allow)
    }
        
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        ProgView.progress = Float(webView.estimatedProgress)
    }
        
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        ProgView.isHidden = true
    }
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Swift.Void) {
        decisionHandler(WKNavigationResponsePolicy.allow)
    }
    deinit {
        self.TaleWebView = nil
    }
        
        
}
