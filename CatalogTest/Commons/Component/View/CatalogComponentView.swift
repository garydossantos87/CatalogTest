//
//  CatalogComponentView.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 19/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import SnapKit

final class CatalogComponentView: BaseView {
    
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var containerTypeView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var separatorSaveView: UIView!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var separatorShareView: UIView!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var typeImageView: UIImageView!
    @IBOutlet weak var couponLabel: UILabel!
    
    let viewModel = CatalogComponentViewModel()
    
    // ----------------------------
    // MARK: - Setups
    // ----------------------------
    
    override func setupLayout() {
        super.setupLayout()
        
        nameLabel.setup(withStyle: ThemeStyle.textH0.style())
        dateLabel.setup(withStyle: ThemeStyle.textH1.style())
        couponLabel.setup(withStyle: ThemeStyle.textH2.style())
        separatorSaveView.backgroundColor = ThemeColor.chatelle.color()
        separatorShareView.backgroundColor = ThemeColor.chatelle.color()
    }
    
    override func setupRx() {
        super.setupRx()
        
        viewModel.name.bind(to: nameLabel.rx.text).disposed(by: disposeBag)
        viewModel.favorite.bind(to: favoriteButton.rx.image()).disposed(by: disposeBag)
        viewModel.save.bind(to: saveButton.rx.image()).disposed(by: disposeBag)
        viewModel.share.bind(to: shareButton.rx.image()).disposed(by: disposeBag)
        viewModel.date.bind(to: dateLabel.rx.text).disposed(by: disposeBag)
        viewModel.coupon.bind(to: couponLabel.rx.text).disposed(by: disposeBag)
        
        viewModel.type.subscribe(onNext: { [weak self] type in
            guard let `self` = self, let type = type else { return }
            
            self.couponLabel.isHidden = type == .catalog
            self.typeImageView.image = type == .catalog ? ThemeImage.catalog.image() : ThemeImage.coupon.image()
        }).disposed(by: disposeBag)
    }
    
}
