//
//  Promotion.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import ObjectMapper

final class Promotion: Mappable {
    
    var name: String = ""
    var coupon: String = ""
    var description: String = ""
    var topBanner: String = ""
    var bottomBanner: String = ""
    var discount: Double = 0.0
    var action: PromotionActionType = .none

    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        name            <- map["name"]
        coupon          <- map["coupon"]
        description     <- map["description"]
        topBanner       <- map["topBanner"]
        bottomBanner    <- map["bottomBanner"]
        discount        <- map["discount"]
    }
    
}
