//
//  ProfileInteractor.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation
import Alamofire
class ProfileInteractor: PresenterToInteractorProfileProtocol {
    var profilePresenter: InteractorToPresenterProfileProtocol?
    
    func tumYemekleriYukle() {
        AF.request("http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php",method: .get).responseJSON{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data)
                    var liste = [Yemekler]()
                    if let gelenListe = cevap.yemekler{
                        liste = gelenListe
                    }
                    self.profilePresenter?.presenteraVeriGonder(yemeklerListesi: liste)
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    
}



