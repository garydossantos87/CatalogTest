//
//  CatalogueViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogueViewController: CatalogueBaseViewController<CatalogueViewModel>, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate  {

    @IBOutlet weak var collectionView: UICollectionView!

    private let clusterListFlowLayout = CenterCellCollectionViewFlowLayout()
    private let itemWidthPercentage: CGFloat = 1.0
    private var itemHeight: CGFloat = 293.0
    
    override func createViewModel() -> CatalogueViewModel {
        return CatalogueViewModel()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupFlowLayout()
        setupCollectionView()
    }

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

    }

    override func setupRx() {
        super.setupRx()
    }

    // ----------------------------
    // MARK: - Private Func 🔐
    // ----------------------------

    private func setupFlowLayout() {
        clusterListFlowLayout.sectionInset = UIEdgeInsets.zero
        clusterListFlowLayout.minimumLineSpacing = Constants.zero
        clusterListFlowLayout.minimumInteritemSpacing = Constants.zero
        clusterListFlowLayout.headerReferenceSize = CGSize.zero
        clusterListFlowLayout.footerReferenceSize = CGSize.zero
        clusterListFlowLayout.itemSize = CGSize(width: (UIScreen.main.bounds.width * itemWidthPercentage).rounded(), height: itemHeight)
        clusterListFlowLayout.scrollDirection = .vertical
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = ThemeColor.transparent.color()
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.setCollectionViewLayout(clusterListFlowLayout, animated: true)
        registerCollectionCells()
    }

    private func registerCollectionCells() {
        CatalogViewCell.register(collectionView: collectionView, cellClass: CatalogViewCell.self)
    }

    // ------------------------------------
    // MARK: - UICollectionViewDataSource
    // ------------------------------------

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.collectionViewLayout.invalidateLayout()
        return viewModel.numberOfRows(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier(indexPath: indexPath), for: indexPath) as? CatalogViewCell {
            collectionViewCell.set(viewModel: viewModel.cellViewModel(indexPath: indexPath))
            return collectionViewCell

            //            collectionViewCell.set(viewModel: viewModel.cellViewModel(indexPath: indexPath), hasAddress: viewModel.address != nil)
            //            let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onCollectionViewPushed(_:)))
            //            collectionViewCell.clusterMapDetailView.bottomContainerView.addGestureRecognizer(tapGesture)
            //            tapGesture.delegate = self
            //            return collectionViewCell
        }
        return UICollectionViewCell()
    }
}
