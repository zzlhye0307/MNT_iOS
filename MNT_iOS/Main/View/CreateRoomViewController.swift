//
//  SetRoomNameViewController.swift
//  MNT_iOS
//
//  Created by Jihye on 2020/01/29.
//  Copyright © 2020 최민섭. All rights reserved.
//

import UIKit
import Kingfisher
import RxSwift
import RxCocoa

class CreateRoomViewController: ViewController {
    
    let Label = UILabel(text: "👻설명 추가 예정👻", numberOfLines: 0)
    let textField = UITextField(placeholder: "방 이름을 입력해주세요")
    var button = UIButton(title: "다음", titleColor: .black)
    
    var viewModel: CreateRoomViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()

        //navigationController?.navigationBar.isHidden = false
    }
    
    override func setupLayout() {
        view.stack(Label.withHeight(50),
                   textField.withHeight(50),
                   button.withHeight(50),
                   alignment: .center)
            .withMargins(.init(top: view.frame.height/2 - 200,
                               left: 0,
                               bottom: view.frame.height/2 - 200,
                               right: 0))
    }

}

extension CreateRoomViewController: ViewModelBindableType {
    func bindViewModel() {
        guard let viewModel = viewModel else { return }
        
        textField.rx.text.orEmpty
            .bind(to: viewModel.roomNameTextRelay)
            .disposed(by: rx.disposeBag)
        button.rx.action = viewModel.presentSetRoomDetailAction()
    }
}
