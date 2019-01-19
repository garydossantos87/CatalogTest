//
//  SplasViewModel.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class SplashViewModel: BaseViewModel {

    private let getCatalogsUseCase = GetCatalogsUseCaseImpl()

    override func onViewWillAppear() {
        super.onViewWillAppear()

        retrieveCatalogs()
    }

    // ----------------------------
    // MARK: - Private Func 🔐
    // ----------------------------

    private func retrieveCatalogs() {
        _ = getCatalogsUseCase.execute()
            .subscribeOn(ConcurrentDispatchQueueScheduler(qos: .background))
            .observeOn(MainScheduler.instance)
            .subscribe { event in
                switch event {
                case .success(let catalogs):
                    print(catalogs)
                case .error(let error):
                    self.actionError.execute(error.apiError())
                }
            }.disposed(by: disposeBag)
    }

}
