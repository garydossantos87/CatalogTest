//
//  CatalogueViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogueViewController: CatalogueBaseViewController<CatalogueViewModel>, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var collectionView: UICollectionView!

    private let flowLayoutSize: CGFloat = 8.0
    private let flowLayout = UICollectionViewFlowLayout()

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
        flowLayout.footerReferenceSize = CGSize(width: flowLayoutSize, height: flowLayoutSize)
        flowLayout.headerReferenceSize = CGSize(width: flowLayoutSize, height: flowLayoutSize)
        flowLayout.sectionInset = UIEdgeInsets(top: flowLayoutSize - 2.0 , left: flowLayoutSize, bottom: flowLayoutSize - 2.0, right: flowLayoutSize)
        flowLayout.minimumLineSpacing = flowLayoutSize
        flowLayout.minimumInteritemSpacing = flowLayoutSize
    }

    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = ThemeColor.transparent.color()
        collectionView.showsVerticalScrollIndicator = false
        collectionView.contentInsetAdjustmentBehavior = .always
        collectionView.setCollectionViewLayout(flowLayout, animated: true)
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

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let totalSpace = flowLayout.sectionInset.left
            + flowLayout.sectionInset.right
            + (flowLayout.minimumInteritemSpacing * CGFloat(cellsPerRow() - 1))
        let size = (collectionView.bounds.width - totalSpace) / CGFloat(cellsPerRow())
        return CGSize(width: size, height: size * viewModel.heightByType(indexPath: indexPath))
    }

    // ----------------------------
    // MARK: - Private Func 🔐
    // ----------------------------

    private func cellsPerRow() -> Int {
        switch UIDevice.current.userInterfaceIdiom {
        case .pad where UIDevice.current.orientation.isLandscape:
            return 6
        case .pad where UIDevice.current.orientation.isPortrait:
            return 3
        default:
            return 2
        }
    }

}
