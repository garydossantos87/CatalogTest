//
//  Catalog.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import ObjectMapper
import BaseRxApplication

final class Catalog: BaseEntity {

    var id: String? = nil
    var coupon: Coupon = Coupon()
    var dateEnd: Date = Date()
    var retailerId: String = ""
    var retailerName: String = ""
    var nearestStore: NearestStore = NearestStore()

    override func mapping(map: Map) {
        id                  <- map["catalog_id"]
        coupon              <- map["coupon"]
        dateEnd             <- map["date_end"]
        retailerId          <- map["retailer_id"]
        retailerName        <- map["retailer_name"]
        nearestStore        <- map["nearest_store"]
    }

}