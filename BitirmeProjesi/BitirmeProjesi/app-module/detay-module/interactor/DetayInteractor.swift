//
//  DetayInteractor.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation
import Alamofire
class DetayInteractor: PresenterToInteractorDetayProtocol{
    func sepeteEkle(yemek: Yemekler, adet: Int, kullanici_ad: String) {
        let params: Parameters = ["yemek_adi":yemek.yemek_adi!, "yemek_fiyat":Int(yemek.yemek_fiyat!)!, "yemek_resim_adi":yemek.yemek_resim_adi!, "yemek_siparis_adet":adet, "kullanici_adi":kullanici_ad]
        AF.request("http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php", method: .post, parameters: params).responseJSON{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                        print(json)
                    }
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
