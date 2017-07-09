//
//  GankAlert.swift
//  Gank
//
//  Created by 叶帆 on 2017/7/8.
//  Copyright © 2017年 Suzhou Coryphaei Information&Technology Co., Ltd. All rights reserved.
//

import UIKit

final class GankAlert {
    
    class func alert(title: String?, message: String, dismissTitle: String, inViewController viewController: UIViewController?, withDismissAction dismissAction: (() -> Void)?) {
        
        SafeDispatch.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let subView = alertController.view.subviews.first!
            let alertContentView = subView.subviews.first!
            alertContentView.backgroundColor = UIColor.white
            alertContentView.layer.cornerRadius = 5
            
            let action: UIAlertAction = UIAlertAction(title: dismissTitle, style: .default) { action in
                if let dismissAction = dismissAction {
                    dismissAction()
                }
            }
            alertController.addAction(action)
            
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
    
    class func alertKnown(title: String?, message: String, inViewController viewController: UIViewController?) {
        
        alert(title: title, message: message, dismissTitle: String.titleKnown, inViewController: viewController, withDismissAction: nil)
    }
    
    class func confirmOrCancel(title: String?, message: String, confirmTitle: String, cancelTitle: String, inViewController viewController: UIViewController?, withConfirmAction confirmAction: @escaping () -> Void, cancelAction: @escaping () -> Void) {
        
        SafeDispatch.async {
            
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            
            let cancelAction: UIAlertAction = UIAlertAction(title: cancelTitle, style: .cancel) { action in
                cancelAction()
            }
            alertController.addAction(cancelAction)
            
            let confirmAction: UIAlertAction = UIAlertAction(title: confirmTitle, style: .default) { action in
                confirmAction()
            }
            alertController.addAction(confirmAction)
            
            viewController?.present(alertController, animated: true, completion: nil)
        }
    }
}
