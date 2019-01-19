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

    case textH0, textH1

    func style() -> Style {
        switch self {
        case .textH0:
            var style = Style()
            style.font = ThemeFont.regular_15.font()
            style.textColor = ThemeColor.chatelle.color()
            return style
        case .textH1:
            var style = Style()
            style.font = ThemeFont.bold_14.font()
            style.textColor = ThemeColor.sprout.color()
            style.alignment = .center
            return style
        }
    }

}

enum ThemeFont {

    case bold_14, bold_16, regular_15

    func font() -> UIFont {
        switch self {
        case .bold_14:
            return UIFont.boldSystemFont(ofSize: 14.0)
        case .bold_16:
            return UIFont.boldSystemFont(ofSize: 16.0)
        case .regular_15:
            return UIFont.systemFont(ofSize: 15.0)
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

    case planet, favorite, share, save, catalog, coupon

    func image() -> UIImage {
        var imageName = ""

        switch self {
        case .planet:
            imageName = "ic_planet"
        case .favorite:
            imageName = "ic_fav"
        case .share:
            imageName = "ic_share"
        case .save:
            imageName = "ic_save"
        case .catalog:
            imageName = "ic_save"
        case .coupon:
            imageName = "ic_save"
        }

        return UIImage.imageWithImageName(imageName)
    }

}

enum ThemeColor {

    case transparent, white, thunderbird, chatelle, sprout

    func color() -> UIColor {

        switch self {
        case .white:
            return .white
        case .thunderbird:
            return UIColor.rgb(rgbValue: 0xC9191F) // http://chir.ag/projects/name-that-color/#C9191F
        case .transparent:
            return UIColor.clear
        case .chatelle:
            return UIColor.rgb(rgbValue: 0xB4ACB8) // http://chir.ag/projects/name-that-color/#B4ACB8
        case .sprout:
            return UIColor.rgb(rgbValue: 0xB6D9B0) // http://chir.ag/projects/name-that-color/#B6D9B0
        }
    }

    func cgColor() -> CGColor {
        return color().cgColor
    }

}
