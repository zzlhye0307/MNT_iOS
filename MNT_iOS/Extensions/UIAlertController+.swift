//
//  UIAlertController+.swift
//  MNT_iOS
//
//  Created by Jihye on 2020/02/07.
//  Copyright © 2020 최민섭. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    /// `UIAlertController` Helper.
    static func alert(title: String?,
                      message: String?,
                      style: UIAlertController.Style = .alert) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: style)
        return alert
    }
    
    /// `UIAlertAction` Helper.
    @discardableResult
    func action(title: String?,
                style: UIAlertAction.Style = .default,
                completion: ((UIAlertAction) -> Void)? = nil) -> UIAlertController {
        let action = UIAlertAction(title: title, style: style) { completion?($0) }
        addAction(action)
        return self
    }
    
    /// 빌더 패턴을 통해 만들어진 `UIAlertController` present.
    func present(to viewController: UIViewController?,
                 animated: Bool = true,
                 completion: (() -> Void)? = nil) {
        DispatchQueue.main.async {
            if !(viewController?.presentedViewController is UIAlertController) {
                viewController?.present(self, animated: animated, completion: completion)
            }
        }
    }
}
