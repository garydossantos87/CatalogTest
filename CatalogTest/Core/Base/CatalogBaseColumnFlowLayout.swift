//
//  ColumnFlowLayout.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import UIKit

class CatalogBaseColumnFlowLayout: UICollectionViewFlowLayout {

    var cellsPerRow: Int = 2

    init(minimumInteritemSpacing: CGFloat = 6.0, minimumLineSpacing: CGFloat = 6.0, sectionInset: UIEdgeInsets = UIEdgeInsets(top: 4.0, left: 6.0, bottom: 4.0, right: 6.0), headerReferenceSize: CGSize = CGSize(width: 4.0, height: 4.0), footerReferenceSize: CGSize = CGSize(width: 4.0, height: 4.0)) {
        super.init()

        self.cellsPerRow = self.setupCellPerRow()
        self.minimumInteritemSpacing = minimumInteritemSpacing
        self.minimumLineSpacing = minimumLineSpacing
        self.headerReferenceSize = headerReferenceSize
        self.footerReferenceSize = footerReferenceSize
        self.sectionInset = sectionInset
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func prepare() {
        super.prepare()

        guard let collectionView = collectionView else { return }

        let marginsAndInsets = sectionInset.left + sectionInset.right + collectionView.safeAreaInsets.left + collectionView.safeAreaInsets.right + minimumInteritemSpacing * CGFloat(cellsPerRow - 1)
        let itemWidth = ((collectionView.bounds.size.width - marginsAndInsets) / CGFloat(cellsPerRow)).rounded(.down)
        itemSize = CGSize(width: itemWidth, height: itemWidth * 1.8)
    }

    override func invalidationContext(forBoundsChange newBounds: CGRect) -> UICollectionViewLayoutInvalidationContext {
        let context = super.invalidationContext(forBoundsChange: newBounds) as! UICollectionViewFlowLayoutInvalidationContext
        context.invalidateFlowLayoutDelegateMetrics = newBounds.size != collectionView?.bounds.size
        return context
    }

    // ----------------------------
    // MARK: - Private Func 🔐
    // ----------------------------

    private func setupCellPerRow() -> Int {
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
