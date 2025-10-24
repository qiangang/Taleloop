//
//  TaleApplePayObject.swift
//  Taleoop
//
//  Created by Ben on 27/5/2025.
//

import UIKit
import StoreKit

class TaleApplePayObject: NSObject {
    internal var chylomicronID : String?
    
    var CallBack:()->Void = { ()->Void in}
    
    static var shared = TaleApplePayObject()
    
    private override init() {
    }
    
    override class func copy() -> Any {
        return self
    }
}
extension TaleApplePayObject: SKPaymentTransactionObserver,SKProductsRequestDelegate{
    internal func requestAppleObjPayBlock(_ productID:String,_ callBack:@escaping (()->Void))  {
        self.chylomicronID = productID
        self.CallBack = callBack
        if !SKPaymentQueue.canMakePayments() {
            return
        }
        SKPaymentQueue.default().add(self)
        let requst = SKProductsRequest.init(productIdentifiers: Set.init([productID]))
        requst.delegate = self
        requst.start()
    }
    
    internal func productsRequest(_ request: SKProductsRequest, didReceive response: SKProductsResponse) {
        let productArray = response.products
        if productArray.count == 0 {
            HideLoad()
            return
        }
        var product:SKProduct!
        for pro in productArray {
            if pro.productIdentifier == chylomicronID {
                product = pro
                break
            }
        }
        if product == nil {
            HideLoad()
            return
        }
        let payOyment = SKMutablePayment.init(product: product)
        payOyment.quantity = 1
        SKPaymentQueue.default().add(payOyment)
    }
    
    
    internal func paymentQueue(_ queue: SKPaymentQueue, updatedTransactions transactions: [SKPaymentTransaction]) {
        for tran in transactions {
            switch tran.transactionState {
            case .purchased:
                SKPaymentQueue.default().finishTransaction(tran)
                transactionPay(transaction: tran)
                break
            case.purchasing:
                break
                
            case.restored:
                HideLoad()
                SKPaymentQueue.default().finishTransaction(tran)
                break
            case.failed:
                HideLoad()
                SKPaymentQueue.default().finishTransaction(tran)
                break
            default:
                break
            }
        }
    }
    
    
    private func transactionPay(transaction:SKPaymentTransaction) {
        guard let rektUrlData = Bundle.main.appStoreReceiptURL else {
            return
        }
        guard let rektUrlDatas = try? Data(contentsOf: rektUrlData) else {
            return
        }
        HideLoad()
        ShowLoad()
        
        let dic = [
            "weldable":self.chylomicronID!,
            "clod":"0",
            "walleye":rektUrlDatas.base64EncodedString(options: .endLineWithLineFeed),
            "foodgrain":"Taleoop Apple Pay"
        ]
        GetAfricaBlock(dic) { armonica, success in
            HideLoad()
            if success {
                self.CallBack()
            }
        }
        SKPaymentQueue.default().finishTransaction(transaction)
    }
}
