//
//  ProfilePresenter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class ProfilePresenter: ViewToPresenterProfileProtocol{
    var profileInteractor: PresenterToInteractorProfileProtocol?
    
    var profileView: PresenterToViewProfileProtocol?
    
    func yemekleriYukle() {
        profileInteractor?.tumYemekleriYukle()
    }
    
    
    
    
}
extension ProfilePresenter : InteractorToPresenterProfileProtocol{
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>) {
        profileView?.ViewaVeriGonder(yemeklerListesi: yemeklerListesi)
    }
    
    
}
