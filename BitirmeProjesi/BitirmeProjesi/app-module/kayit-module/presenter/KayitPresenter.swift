//
//  KayitPresenter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class KayitPresenter : ViewToPresenterKayitProtocol{
    var kayitInteractor: PresenterToInteractorKayitProtocol?
    var kayitView: PresenterToViewKayitProtocol?
    func kayit(kullanici_ad: String, kullanici_sifre: String, kullanici_email: String) {
        kayitInteractor?.kayitOl(kullanici_ad: kullanici_ad, kullanici_sifre: kullanici_sifre, kullanici_email: kullanici_email)
    }
    
    
}
extension KayitPresenter: InteractorToPresenterKayitProtocol {
    func presenteraVeriGonder(bool: Bool) {
        kayitView?.viewaVeriGonder(bool: bool)
    }
}
