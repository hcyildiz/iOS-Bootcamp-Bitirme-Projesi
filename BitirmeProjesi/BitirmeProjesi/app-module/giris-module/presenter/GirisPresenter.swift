//
//  GirisPresenter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class GirisPresenter: ViewToPresenterGirisProtocol {
    var girisView: PresenterToViewGirisProtocol?
    var girisInteractor: PresenterToInteractorGirisProtocol?
    
    func giris(kullanici_ad: String){
        girisInteractor?.girisYap(kullanici_ad: kullanici_ad)
    
    }
    
}
extension GirisPresenter : InteractorToPresenterGirisProtocol{
    func presenteraVeriGonder(kullanici:Kullanicilar) {
        girisView?.viewaVeriGonder(kullanici: kullanici)
    }
}
