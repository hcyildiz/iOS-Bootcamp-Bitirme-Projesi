//
//  KayitRouter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 14.12.2021.
//

import Foundation

class KayitRouter: PresenterToRouterKayitProtocol{
    static func createModule(ref: KayitVC) {
        let presenter: ViewToPresenterKayitProtocol & InteractorToPresenterKayitProtocol = KayitPresenter()
        ref.kayitPresenterNesnesi = presenter
        ref.kayitPresenterNesnesi?.kayitInteractor = KayitInteractor()
        ref.kayitPresenterNesnesi?.kayitInteractor?.kayitPresenter = presenter
        ref.kayitPresenterNesnesi?.kayitView = ref
        
    }
}
