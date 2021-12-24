//
//  YemekCollectionViewCell.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 14.12.2021.
//

import UIKit

class YemekCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var labelYemekFiyat: UILabel!
    @IBOutlet weak var labelYemekAd: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    
    func setData(yemek:Yemekler){
        labelYemekFiyat.text = "\(yemek.yemek_fiyat!)₺"
        labelYemekAd.text = yemek.yemek_adi
        if let yra = yemek.yemek_resim_adi{
            resimGoster(resimAdi: yra)
        }
        
        
    }
    func resimGoster(resimAdi:String){
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
            DispatchQueue.main.async {
                self.imgView.kf.setImage(with: url)
            }
            
        }
    }
}
