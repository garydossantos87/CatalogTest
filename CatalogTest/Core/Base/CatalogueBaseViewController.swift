//
//  CatalogueBaseViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import SnapKit
import RxSwift

class CatalogueBaseViewController<VM: BaseViewModel>: BaseViewController<VM>, UIScrollViewDelegate {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        backNavBarItem(withTitle: "")
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    // ----------------------------
    // MARK: - Public methods 🔓
    // ----------------------------

    public func backNavBarItem(withTitle title: String) {
        navigationController?.navigationBar.topItem?.backBarButtonItem = UIBarButtonItem(title: title, style: .plain, target: nil, action: nil)
    }

}
