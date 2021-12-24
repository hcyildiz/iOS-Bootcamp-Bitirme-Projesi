//
//  SepetInteractor.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation
import Alamofire
class SepetInteractor: PresenterToInteractorSepetProtocol{
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func sepetListele(kullanici_ad: String) {
        let params: Parameters = ["kullanici_adi":kullanici_ad]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post,parameters: params).responseJSON{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(SepetCevap.self, from: data)
                    var liste = [Sepet]()
                    if let gelenListe = cevap.sepet_yemekler{
                        liste = gelenListe
                    }
                    self.sepetPresenter?.presenteraVeriGonder(sepetListe: liste)
                }catch{
                    let liste = [Sepet]()
                    self.sepetPresenter?.presenteraVeriGonder(sepetListe: liste)
                    //print(error.localizedDescription)
                }
            }
            
            
        }
    }
    
    func sepetSil(kullanici_ad: String, urun_id: Int) {
        
        let params : Parameters = ["sepet_yemek_id":urun_id, "kullanici_adi":kullanici_ad]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON { response in
            if let data = response.data {
                do {
                    if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        self.sepetListele(kullanici_ad: kullanici_ad)
                    }
                }catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    func sepetTemizle(kullanici_ad: String, urun_id: Array<Int>) {
        for urunId in urun_id {
            let params : Parameters = ["sepet_yemek_id":urunId, "kullanici_adi":kullanici_ad]
            AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php",method: .post,parameters: params).responseJSON { response in
                if let data = response.data {
                    do {
                        if let _ = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                            self.sepetListele(kullanici_ad: kullanici_ad)
                        }
                    }catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
}
