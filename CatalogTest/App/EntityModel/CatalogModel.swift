//
//  CatalogModel.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

enum CatalogType { case catalog, coupon }

struct CatalogModel {

    var id: String = ""
    var name: String = ""
    var date: String = ""
    var type: CatalogType = .catalog
    var address: String = ""
    var phone: String = ""
    var web: String = ""
    var couponDescription: String = ""
    var distance: String = ""
    
}
