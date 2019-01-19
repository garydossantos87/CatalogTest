//
//  Gateway.swift
//  FVEC
//
//  Created by Enrique Canedo on 04/04/2018.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift
import BaseRxApplication

protocol AppGateway {
        
    func retrievePromotions() -> Single<[PromotionEntity]>
    
}
