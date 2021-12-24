//
//  SepetPresenter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

class SepetPresenter: ViewToPresenterSepetProtocol{
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    var sepetView: PresenterToViewSepetProtocol?
    
    func sepet(kullanici_ad: String) {
        sepetInteractor?.sepetListele(kullanici_ad: kullanici_ad)
    }
    
    func sil(kullanici_ad: String, urun_id: Int) {
        sepetInteractor?.sepetSil(kullanici_ad: kullanici_ad, urun_id: urun_id)
    }
    func temizle(kullanici_ad: String, urun_id: Array<Int>) {
        sepetInteractor?.sepetTemizle(kullanici_ad: kullanici_ad, urun_id: urun_id)
    }
    
    
}
extension SepetPresenter: InteractorToPresenterSepetProtocol{
    func presenteraVeriGonder(sepetListe: Array<Sepet>) {
        sepetView?.viewaVeriGonder(sepetListe: sepetListe)
    }
    
    
}
