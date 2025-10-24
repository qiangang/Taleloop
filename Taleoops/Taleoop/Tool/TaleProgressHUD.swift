//
//  TaleProgressHUD.swift
//  Taleoop
//
//  Created by Ben on 27/5/2025.
//

import Foundation
import MBProgressHUD

class ProgressHUD {
    static let shared = ProgressHUD()
    private init() {}
    
    private var hud: MBProgressHUD?
    
    func showLoad(in view: UIView = Windows , _ showTime:CGFloat = 120.0) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)

        hud?.bezelView.style = .solidColor
        DispatchQueue.main.asyncAfter(deadline: .now() + showTime) {
            ProgressHUD.shared.hide()
           }
    }
    
    func hide() {
        hud?.hide(animated: true)
        hud = nil
    }
    
    func showInfo(in view: UIView, text: String) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud?.mode = .text
        hud?.label.text = text
        hud?.hide(animated: true, afterDelay: 1.0)
    }
    
    func showError(in view: UIView, text: String) {
        hud = MBProgressHUD.showAdded(to: view, animated: true)
        hud?.mode = .text
        hud?.label.text = text
        hud?.hide(animated: true, afterDelay: 1.0)
    }
}
