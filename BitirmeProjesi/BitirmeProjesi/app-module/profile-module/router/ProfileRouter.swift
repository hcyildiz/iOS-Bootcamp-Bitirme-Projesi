//
//  ProfileRouter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class ProfileRouter : PresenterToRouterProfileProtocol{
    static func createModule(ref: ProfileVC) {
        let presenter : ViewToPresenterProfileProtocol & InteractorToPresenterProfileProtocol = ProfilePresenter()
        ref.profilePresenterNesnesi = presenter
        ref.profilePresenterNesnesi?.profileInteractor = ProfileInteractor()
        ref.profilePresenterNesnesi?.profileView = ref
        ref.profilePresenterNesnesi?.profileInteractor?.profilePresenter = presenter
        
    }
}
