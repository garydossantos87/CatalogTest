//
//  GetPromotionListUseCaseImpl.swift
//  FVEC
//
//  Created by Enrique Canedo on 7/6/18.
//  Copyright © 2018 BeRepublic. All rights reserved.
//

import RxSwift
import BaseRxApplication

final class GetPromotionListUseCaseImpl: BaseUseCaseImpl<PromotionRepository>, GetPromotionListUseCase {

    init() {
        super.init(repository: PromotionRepositoryImpl())
    }
    
    func execute() -> Single<[Promotion]> {
        return repository.retrieveList()
            .flatMap { promotions -> Single<[Promotion]> in
                return Single.just([Promotion()])
        }
    }
    
}
