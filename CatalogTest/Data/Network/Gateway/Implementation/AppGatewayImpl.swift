//
//  AppGatewayImpl.swift
//  FVEC
//
//  Created by Enrique Canedo on 04/04/2018.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift
import BaseRxApplication

final class AppGatewayImpl: AppGateway {
    
    static let shared = AppGatewayImpl()
    private var appService = AppService()
    
    private init() {}
    
    func retrieveCatalogs() -> Single<[CatalogEntity]> {
        return appService.retrieveCatalogs()
    }

}
