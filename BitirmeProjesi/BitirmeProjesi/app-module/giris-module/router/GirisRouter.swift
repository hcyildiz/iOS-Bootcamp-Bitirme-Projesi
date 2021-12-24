//
//  GirisRouter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class GirisRouter : PresenterToRouterGirisProtocol{
    static func createModule(ref: GirisVC) {
        let presenter : ViewToPresenterGirisProtocol & InteractorToPresenterGirisProtocol = GirisPresenter()
        ref.girisPresenterNesnesi = presenter
        ref.girisPresenterNesnesi?.girisInteractor = GirisInteractor()
        ref.girisPresenterNesnesi?.girisView = ref
        ref.girisPresenterNesnesi?.girisInteractor?.girisPresenter = presenter
    }
}
