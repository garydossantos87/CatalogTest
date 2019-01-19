//
//  PromotionRepositoryImpl.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift

final class PromotionRepositoryImpl: PromotionRepository {
    
    private let restAPI = AppGatewayImpl.shared
    private let promotionEntityDataMapper = PromotionEntityDataMapper()
    
    func retrieveList() -> Single<[Promotion]> {
        return restAPI.retrievePromotions()
            .map { promotionEntities -> [Promotion] in
                return self.promotionEntityDataMapper.transform(entityList: promotionEntities)
        }
    }
    
}
