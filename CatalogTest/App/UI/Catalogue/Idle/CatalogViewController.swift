//
//  CatalogViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogViewController: CatalogueBaseViewController<CatalogViewModel>, UICollectionViewDelegate, UICollectionViewDataSource, UIGestureRecognizerDelegate, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var collectionView: UICollectionView!

    private let flowLayoutSize: CGFloat = 8.0
    private let flowLayout = UICollectionViewFlowLayout()

    override func createViewModel() -> CatalogViewModel {
        return CatalogViewModel()
    }

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

        setupFlowLayout()
        setupCollectionView()
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
        flowLayout.sectionInset = UIEdgeInsets(top: flowLayoutSize, left: flowLayoutSize, bottom: flowLayoutSize, right: flowLayoutSize)
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
        collectionView.register(UINib(nibName: CatalogHeaderViewCell.reuseIdentifier, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CatalogHeaderViewCell.reuseIdentifier)
    }

    // ------------------------------------
    // MARK: - UICollectionViewDataSource
    // ------------------------------------

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows(section: section)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let catalogViewCellModel = viewModel.cellViewModel(indexPath: indexPath) as? CatalogViewCellModel,
            let collectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: viewModel.cellIdentifier(indexPath: indexPath), for: indexPath) as? CatalogViewCell {
            collectionViewCell.set(viewModel: catalogViewCellModel)
            return collectionViewCell
        }
        return UICollectionViewCell()
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader, let catalogHeaderViewCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CatalogHeaderViewCell.reuseIdentifier, for: indexPath) as? CatalogHeaderViewCell {
            catalogHeaderViewCell.viewModel.setup(withTitle: viewModel.titleForHeaderInSection(indexPath.section))
            return catalogHeaderViewCell
        } else {
            return UICollectionReusableView()
        }
    }

    // ------------------------------------
    // MARK: - UICollectionViewDelegate
    // ------------------------------------

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.didSelectItemAt(indexPath: indexPath)
    }

    // ---------------------------------------------
    // MARK: - UICollectionViewDelegateFlowLayout
    // ---------------------------------------------

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {

        return CGSize(width: collectionView.bounds.size.width, height: CatalogHeaderViewCell.preferredHeightSize)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {

        return CGSize.zero
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
