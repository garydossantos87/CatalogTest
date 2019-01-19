//
//  Constants.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication

struct Constants {

    public static let zero: CGFloat = 0.0

    // ------------------------
    // MARK: - Navigation Bar
    // ------------------------

    public static let shadowNavigationBarImage: UIImage = UIImage.degradate(bounds: CGRect(x: 0.0, y: 0.0, width: 10.0, height: 3.0), from: UIColor.black.withAlphaComponent(0.7), to: .clear, orientation: .vertical)

    // ------------------------
    // MARK: - Formats
    // ------------------------

    public static let dateFormat: String = "dd/mm/yyyy"

}
