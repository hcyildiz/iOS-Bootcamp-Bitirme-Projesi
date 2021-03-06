//
//  SepetRouter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

class SepetRouter: PresenterToRouterSepetProtocol{
    static func createModule(ref: SepetVC) {
        let presenter: ViewToPresenterSepetProtocol & InteractorToPresenterSepetProtocol = SepetPresenter()
        ref.sepetPresenterNesnesi = presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter
    }
}
