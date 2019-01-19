//
//  PromotionModel.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

enum PromotionActionType: String { case fixed = "by_fixed", percent = "by_percent", none = "" }

struct PromotionModel {
    
    var name: String = ""
    var coupon: String = ""
    var topBanner: String = ""
    var bottomBanner: String = ""
    var discount: Double = 0.0
    var action: PromotionActionType = .none
    
}
