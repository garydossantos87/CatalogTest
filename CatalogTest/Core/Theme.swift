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

    case textH0, textH1, textH2, textH3, textH4,  buttonLink

    func style() -> Style {
        switch self {
        case .textH0:
            var style = Style()
            style.font = ThemeFont.regular_14.font()
            style.textColor = ThemeColor.chatelle.color()
            return style
        case .textH1:
            var style = Style()
            style.font = ThemeFont.regular_12.font()
            style.textColor = ThemeColor.sprout.color()
            style.alignment = .center
            return style
        case .textH2:
            var style = Style()
            style.font = ThemeFont.regular_12.font()
            style.textColor = ThemeColor.white.color()
            style.backgroundColor = ThemeColor.thunderbird.color()
            style.alignment = .center
            return style
        case .textH3:
            var style = Style()
            style.font = ThemeFont.bold_16.font()
            style.textColor = ThemeColor.white.color()
            style.backgroundColor = ThemeColor.java.color()
            style.alignment = .center
            return style
        case .textH4:
            var style = Style()
            style.font = ThemeFont.bold_16.font()
            style.textColor = ThemeColor.black.color()
            return style
        case .buttonLink:
            var style = Style()
            style.font = ThemeFont.regular_14.font()
            style.textColor = ThemeColor.thunderbird.color()
            style.alignment = .left
            return style
        }
    }

}

enum ThemeFont {

    case bold_14, bold_16, regular_12, regular_14

    func font() -> UIFont {
        switch self {
        case .bold_14:
            return UIFont.boldSystemFont(ofSize: 14.0)
        case .bold_16:
            return UIFont.boldSystemFont(ofSize: 16.0)
        case .regular_12:
            return UIFont.systemFont(ofSize: 12.0)
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

    case planet, favorite, share, save, catalog, coupon, direction, marker, phone, web, couponDescription, walk

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
            imageName = "ic_catalog"
        case .coupon:
            imageName = "ic_coupon"
        case .direction:
            imageName = "ic_direction"
        case .marker:
            imageName = "ic_marker"
        case .phone:
            imageName = "ic_phone"
        case .web:
            imageName = "ic_web"
        case .couponDescription:
            imageName = "ic_coupon_description"
        case .walk:
            imageName = "ic_walk"
        }

        return UIImage.imageWithImageName(imageName)
    }

}

enum ThemeColor {

    case transparent, white, thunderbird, chatelle, sprout, java, mercury, black

    func color() -> UIColor {

        switch self {
        case .white:
            return .white
        case .black:
            return .black
        case .thunderbird:
            return UIColor.rgb(rgbValue: 0xC9191F) // http://chir.ag/projects/name-that-color/#C9191F
        case .transparent:
            return UIColor.clear
        case .chatelle:
            return UIColor.rgb(rgbValue: 0xB4ACB8) // http://chir.ag/projects/name-that-color/#B4ACB8
        case .sprout:
            return UIColor.rgb(rgbValue: 0xB6D9B0) // http://chir.ag/projects/name-that-color/#B6D9B0
        case .java:
            return UIColor.rgb(rgbValue: 0x18BEBC) // http://chir.ag/projects/name-that-color/#18BEBC
        case .mercury:
            return UIColor.rgb(rgbValue: 0xE8E8E8) //http://chir.ag/projects/name-that-color/#E8E8E8
        }
    }

    func cgColor() -> CGColor {
        return color().cgColor
    }

}
