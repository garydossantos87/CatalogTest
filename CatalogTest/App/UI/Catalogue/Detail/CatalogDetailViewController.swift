//
//  CatalogDetailViewController.swift
//  CatalogTest
//
//  Created by Gary  Dos Santos on 20/01/2019.
//  Copyright © 2019 Gary Dos Santos. All rights reserved.
//

import BaseRxApplication
import RxSwift

final class CatalogDetailViewController: CatalogueBaseViewController<CatalogDetailViewModel> {

    @IBOutlet weak var containerScrollView: UIScrollView!
    @IBOutlet weak var containerCardView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var directionButton: UIButton!
    @IBOutlet weak var addressImageView: UIImageView!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var containerCouponStackView: UIStackView!
    @IBOutlet weak var couponImageView: UIImageView!
    @IBOutlet weak var couponLabel: UILabel!
    @IBOutlet weak var containerWalkStackView: UIStackView!
    @IBOutlet weak var walkImageView: UIImageView!
    @IBOutlet weak var walkLabel: UILabel!
    @IBOutlet weak var containerPhoneStackView: UIStackView!
    @IBOutlet weak var phoneImageView: UIImageView!
    @IBOutlet weak var phoneButton: UIButton!
    @IBOutlet weak var containerWebStackView: UIStackView!
    @IBOutlet weak var webImageView: UIImageView!
    @IBOutlet weak var webButton: UIButton!
    
    override func createViewModel() -> CatalogDetailViewModel {
        return CatalogDetailViewModel()
    }

    // ----------------------------
    // MARK: - Setups
    // ----------------------------

    override func setupLayout() {
        super.setupLayout()

        scrollView = containerScrollView
        containerCardView.elevate(backgroundColor: ThemeColor.white.color(), shadowColor: Constants.cardShadowColor)
        nameLabel.setup(withStyle: ThemeStyle.textH4.style())
        walkLabel.setup(withStyle: ThemeStyle.buttonLink.style().textColor(ThemeColor.black.color()))
        addressLabel.setup(withStyle: ThemeStyle.buttonLink.style().textColor(ThemeColor.black.color()))
        couponLabel.setup(withStyle: ThemeStyle.buttonLink.style().textColor(ThemeColor.black.color()))
        phoneButton.setup(withStyle: ThemeStyle.buttonLink.style())
        webButton.setup(withStyle: ThemeStyle.buttonLink.style())
    }

    override func setupRx() {
        super.setupRx()

        viewModel.walkImage.bind(to: walkImageView.rx.image).disposed(by: disposeBag)
        viewModel.addressImage.bind(to: addressImageView.rx.image).disposed(by: disposeBag)
        viewModel.couponImage.bind(to: couponImageView.rx.image).disposed(by: disposeBag)
        viewModel.phoneImage.bind(to: phoneImageView.rx.image).disposed(by: disposeBag)
        viewModel.webImage.bind(to: webImageView.rx.image).disposed(by: disposeBag)
        viewModel.directionImage.bind(to: directionButton.rx.image()).disposed(by: disposeBag)

        viewModel.catalogModel.asObservable().subscribe(onNext: { [weak self] catalogModel in
            guard let `self` = self, let catalogModel = catalogModel else { return }

            self.nameLabel.text = catalogModel.name
            self.containerWalkStackView.isHidden = catalogModel.distance.isEmpty
            self.walkLabel.text = catalogModel.distance
            self.addressLabel.text = catalogModel.address
            self.containerCouponStackView.isHidden = catalogModel.couponDescription.isEmpty
            self.couponLabel.text = catalogModel.couponDescription
            self.containerPhoneStackView.isHidden = catalogModel.phone.isEmpty
            self.phoneButton.setTitle(catalogModel.phone, for: .normal)
            self.containerWebStackView.isHidden = catalogModel.phone.isEmpty
            self.webButton.setTitle(catalogModel.web, for: .normal)
        }).disposed(by: disposeBag)

        phoneButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self, let catalogModel = self.viewModel.catalogModel.value else { return }

            let allowButton = UIAlertAction(title: "allow".localized, style: .default, handler: { _ in
                self.launchPhone(withNumber: catalogModel.phone)
            })
            self.showAlertController(title: "start_phone".localized, message: "open_phone_message".localized,buttonTitle: "cancel".localized, secondButton: allowButton)
        }).disposed(by: disposeBag)

        webButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self, let catalogModel = self.viewModel.catalogModel.value else { return }

            let allowButton = UIAlertAction(title: "allow".localized, style: .default, handler: { _ in
                self.launchBrowser(url: catalogModel.web)
            })
            self.showAlertController(title: "start_browser".localized, message: "open_browser_message".localized,buttonTitle: "cancel".localized, secondButton: allowButton)
        }).disposed(by: disposeBag)

        directionButton.rx.tap.subscribe(onNext: { [weak self] _ in
            guard let `self` = self, let catalogModel = self.viewModel.catalogModel.value else { return }

            let allowButton = UIAlertAction(title: "allow".localized, style: .default, handler: { _ in
                self.launchGoogleMaps(address: catalogModel.address)
            })
            self.showAlertController(title: "start_navigation".localized, message: "open_maps_message".localized,buttonTitle: "cancel".localized, secondButton: allowButton)
        }).disposed(by: disposeBag)
    }
    
}
