//
//  DetayRouter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

class DetayRouter: PresenterToRouterDetayProtocol{
    static func createModule(ref: DetayVC) {
        ref.detayPresenterNesnesi = DetayPresenter()
        ref.detayPresenterNesnesi?.detayInteractor = DetayInteractor()
    }
}
