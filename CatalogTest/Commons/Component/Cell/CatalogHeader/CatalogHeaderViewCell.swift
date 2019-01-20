//
//  CatalogHeaderViewCell.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 20/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import UIKit
import BaseRxApplication
import RxSwift

final class CatalogHeaderViewCell: BaseCollectionCellView<CatalogHeaderViewCellModel> {

    @IBOutlet weak var titleLabel: UILabel!

    static let preferredHeightSize: CGFloat = 60.0

    override func awakeFromNib() {
        super.awakeFromNib()

        set(viewModel: CatalogHeaderViewCellModel())
    }

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

        titleLabel.setup(withStyle: ThemeStyle.textH3.style())
    }

    override func setupRx() {
        super.setupRx()

        viewModel.title.bind(to: titleLabel.rx.text).disposed(by: disposeBag)
    }
    
}
