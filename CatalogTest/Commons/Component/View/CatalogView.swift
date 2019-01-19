//
//  CatalogView.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

final class CatalogView: BaseView {

    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var containerTypeView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var separatorSaveView: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var separatorShareView: UIView!
    @IBOutlet weak var dateLabel: UILabel!

    let viewModel = CatalogViewModel()

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

        nameLabel.setup(withStyle: ThemeStyle.textH0.style())
        dateLabel.setup(withStyle: ThemeStyle.textH1.style())
        separatorSaveView.backgroundColor = ThemeColor.chatelle.color()
        separatorShareView.backgroundColor = ThemeColor.chatelle.color()
    }

    override func setupRx() {
        super.setupRx()

        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.favorite.bind(to: favoriteButton.rx.image()).disposed(by: disposeBag)
        viewModel.save.bind(to: saveButton.rx.image()).disposed(by: disposeBag)
        viewModel.share.bind(to: shareButton.rx.image()).disposed(by: disposeBag)
        viewModel.date.bind(to: dateLabel.rx.text).disposed(by: disposeBag)
    }
}
