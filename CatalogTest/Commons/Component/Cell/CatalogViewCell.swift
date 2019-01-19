//
//  CatalogViewCell.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import UIKit
import BaseRxApplication
import RxSwift

final class CatalogViewCell: BaseCollectionCellView<CatalogViewCellModel> {

    @IBOutlet weak var catalogView: CatalogView!

    static let preferredHeight: CGFloat = 153.0

    // ----------------------------
    // MARK: - Setups
    // ----------------------------
    
    override func setupRx() {
        super.setupRx()

        viewModel.catalogModel.subscribe(onNext: { [weak self] catalogModel in
            guard let `self` = self, let catalogModel = catalogModel else { return }

            self.catalogView.viewModel.setup(withCatalogModel: catalogModel)
        }).disposed(by: disposeBag)
    }
}
