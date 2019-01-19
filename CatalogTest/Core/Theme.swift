//
//  Theme.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

//
//  Theme.swift
//  FVEC
//
//  Created by Enrique Canedo on 05/04/2018.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import UIKit
import BaseRxApplication

enum ThemeStyle {

    case baseButton

    func style() -> Style {
        switch self {
        case .baseButton:
            var style = Style()
            style.font = ThemeFont.regular_14.font()
            style.backgroundColor = ThemeColor.transparent.color()
            return style
        }
    }

}

enum ThemeFont {

    case bold_16, regular_14

    func font() -> UIFont {
        switch self {
        case .bold_16:
            return UIFont.boldSystemFont(ofSize: 16.0)
        case .regular_14:
            return UIFont.systemFont(ofSize: 14.0)
        }
    }
    // Helper method to unwrap the UIFont
    func safe(font: UIFont!) -> UIFont {
        if let font = font {
            return font
        } else {
            return .systemFont(ofSize: 12.0)
        }
    }

}

enum ThemeImage {

    case planet

    func image() -> UIImage {
        var imageName = ""

        switch self {
        case .planet:
            imageName = "ic_planet"
        }

        return UIImage.imageWithImageName(imageName)
    }

}

enum ThemeColor {

    case transparent, white, thunderbird

    func color() -> UIColor {

        switch self {
        case .white:
            return .white
        case .thunderbird:
            return UIColor.rgb(rgbValue: 0xC9191F) // http://chir.ag/projects/name-that-color/#C9191F
        case .transparent:
            return UIColor.clear
        }
    }

    func cgColor() -> CGColor {
        return color().cgColor
    }

}
