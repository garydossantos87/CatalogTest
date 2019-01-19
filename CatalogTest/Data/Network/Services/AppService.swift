//
//  AppService.swift
//  FVEC
//
//  Created by Enrique Canedo on 04/04/2018.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class AppService: NetworkProxy {
    
    func retrieveCatalogs() -> Single<[CatalogEntity]> {
        return processArray(networkService: NetworkAPI.catalogs)
    }
    
}
