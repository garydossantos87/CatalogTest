//
//  GetCatalogsUseCaseImpl.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import RxSwift
import BaseRxApplication

final class GetCatalogsUseCaseImpl: BaseUseCaseImpl<CatalogRepository>, GetCatalogsUseCase {

    init() {
        super.init(repository: CatalogRepositoryImpl())
    }

    func execute() -> Single<[Catalog]> {
        return repository.retrieve()
    }

}
