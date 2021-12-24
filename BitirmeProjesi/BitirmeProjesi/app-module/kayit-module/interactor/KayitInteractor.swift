//
//  KayitInteractor.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation
import Firebase

class KayitInteractor : PresenterToInteractorKayitProtocol {
    var ref = Database.database().reference()
    var kayitPresenter: InteractorToPresenterKayitProtocol?
    func kayitOl(kullanici_ad: String, kullanici_sifre: String, kullanici_email: String) {
        
        let sorgu = ref.child("kullanicilar").queryOrdered(byChild: "kullanici_ad").queryEqual(toValue: kullanici_ad)
        sorgu.observe(.value, with: { snapshot in
            let isDataNil = snapshot.value as? [String : AnyObject]
            if isDataNil != nil{
                if let gelenVeriButunu = isDataNil {
                    for gelenSatirVerisi in gelenVeriButunu {
                        if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                            if sozluk["kullanici_ad"] as? String == kullanici_ad {
                                self.kayitPresenter?.presenteraVeriGonder(bool: false)
                            }
                        }
                    }
                }
            }else {
                self.ref.child("kullanicilar").childByAutoId().setValue(
                    ["kullanici_id":"","kullanici_ad":kullanici_ad,"kullanici_sifre":kullanici_sifre,"kullanici_email":kullanici_email])
                self.kayitPresenter?.presenteraVeriGonder(bool: true)
            }
            
        })
        
        
    }
    
}
