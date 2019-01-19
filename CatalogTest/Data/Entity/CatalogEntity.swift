//
//  CatalogEntity.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class CatalogEntity: BaseEntity {

    var id: String? = nil
    var coupon: CouponEntity? = nil
    var dateEnd: String? = nil
    var retailerId: String? = nil
    var retailerName: String? = nil
    var nearestStore: NearestStoreEntity? = nil

    override func mapping(map: Map) {
        id                  <- map["catalog_id"]
        coupon              <- map["coupon"]
        dateEnd             <- map["date_end"]
        retailerId          <- map["retailer_id"]
        retailerName        <- map["retailer_name"]
        nearestStore        <- map["nearest_store"]
    }

}
