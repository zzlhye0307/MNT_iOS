//
//  SetRoomDetailViewModel.swift
//  MNT_iOS
//
//  Created by Jihye on 2020/01/29.
//  Copyright © 2020 최민섭. All rights reserved.
//

import Foundation
import RxCocoa
import Action
import RxSwift

class SetRoomDetailViewModel: ViewModel {
    let maxRelay = BehaviorRelay(value: "")
    let beginDateRelay = BehaviorRelay(value: "")
    let endDateRelay = BehaviorRelay(value: "")
    
    func presentReadyAction() -> CocoaAction {
        return CocoaAction { action in
            if self.beginDateRelay.value == "" || self.endDateRelay.value == "" || self.maxRelay.value == "" {
                let alert = UIAlertController(title: nil, message: "값을 모두 입력해주세요", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
                alert.addAction(okAction)
                UIApplication.topViewController()?.present(alert, animated: false)
                
                return Observable.just(action)
            }
            else {
                let viewModel = ReadyViewModel(title: "대기화면", coordinator: self.coordinator)
                let scene = MainScene.ready(viewModel)
                return self.coordinator.transition(to: scene, using: .push, animated: true).asObservable().map { _ in }
            }
        }
    }
}
