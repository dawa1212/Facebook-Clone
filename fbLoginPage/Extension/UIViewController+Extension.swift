//
//  UIViewController+Extension.swift
//  fbLoginPage
//
//  Created by Dawa Pakhrin on 24/12/2023.
//

import UIKit.UIViewController

extension UIViewController {
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showAlertLogout(
            title: String = "Alert",
            message: String,
            confirmTitle: String,
            cancelTitle: String,
            completion: (() -> Void)? = nil
        ) {
            let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)

            let confirmAction = UIAlertAction(title: confirmTitle, style: .default) { _ in
                completion?()
            }
            alert.addAction(confirmAction)

            let cancelAction = UIAlertAction(title: cancelTitle, style: .cancel, handler: nil)
            alert.addAction(cancelAction)

            present(alert, animated: true, completion: nil)
        }
}


