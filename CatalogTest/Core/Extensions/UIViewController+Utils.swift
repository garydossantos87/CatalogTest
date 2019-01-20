//
//  UIViewController+Utils.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 20/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import UIKit

extension UIViewController {

    public func launchBrowser(url: String) {
        if let urlBrowser = URL(string:url), UIApplication.shared.canOpenURL(urlBrowser) {
            UIApplication.shared.open(urlBrowser, options: [:], completionHandler: nil)
        } else {
            print("Can't use browser://");
        }
    }

}
