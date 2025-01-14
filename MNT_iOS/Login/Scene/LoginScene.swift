//
//  LoginScene.swift
//  MNT_iOS
// 
//  Created by 최민섭 on 2020/01/28.
//  Copyright © 2020 최민섭. All rights reserved.
//

import UIKit

enum LoginScene {
    case login(LoginViewModel)
}

extension LoginScene: SceneType {
    func instantiate() -> UIViewController {
        switch self {
        case .login(let viewModel):
            var loginVC = LoginController()
            loginVC.bind(viewModel: viewModel)
            return UINavigationController(rootViewController: loginVC)
        }
    }
}
