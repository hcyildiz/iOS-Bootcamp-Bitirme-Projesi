//
//  GirisInteractor.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation
import Firebase

class GirisInteractor : PresenterToInteractorGirisProtocol {
    
    
    var ref = Database.database().reference()
    var girisPresenter: InteractorToPresenterGirisProtocol?
    
    func girisYap(kullanici_ad: String) {
        let sorgu = ref.child("kullanicilar").queryOrdered(byChild: "kullanici_ad").queryEqual(toValue: kullanici_ad)
        sorgu.observe(.value, with: { snapshot in
            
            if let gelenVeriButunu = snapshot.value as? [String : AnyObject] {
                
                for gelenSatirVerisi in gelenVeriButunu {
                    if let sozluk = gelenSatirVerisi.value as? NSDictionary {
                        let kullaniciId = gelenSatirVerisi.key
                        let kullaniciAd = sozluk["kullanici_ad"] as? String ?? ""
                        let kullaniciSifre = sozluk["kullanici_sifre"] as? String ?? ""
                        let kullaniciEmail = sozluk["kullanici_email"] as? String ?? ""
                        let kullanici = Kullanicilar(kulllanici_id: kullaniciId, kullanici_ad: kullaniciAd , kullanici_sifre: kullaniciSifre, kullanici_email: kullaniciEmail )
                        self.girisPresenter?.presenteraVeriGonder(kullanici: kullanici)
            
                    }
                }
            }
        })
    }
}
