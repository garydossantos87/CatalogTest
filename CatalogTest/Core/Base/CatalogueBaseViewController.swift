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

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

}
