//
//  DetayPresenter.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

class DetayPresenter: ViewToPresenterDetayProtocol {
    var detayInteractor: PresenterToInteractorDetayProtocol?
    
    func sepet(yemek: Yemekler, adet: Int, kullanici_ad: String) {
        detayInteractor?.sepeteEkle(yemek: yemek, adet: adet, kullanici_ad: kullanici_ad)
    }
    
    
}
