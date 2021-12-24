//
//  SepetTableViewCell.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import UIKit
import Kingfisher
class SepetTableViewCell: UITableViewCell {
    @IBOutlet weak var labelYemekAdet: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var labelYemekAd: UILabel!
    @IBOutlet weak var labelYemekFiyat: UILabel!
    
    var intFiyat: Int?
    var intAdet: Int?
    var toplamFiyat: Int?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func setData(sepet:Sepet){
        intFiyat = Int(sepet.yemek_fiyat!)
        intAdet = Int(sepet.yemek_siparis_adet!)
        toplamFiyat = intAdet! * intFiyat!
        labelYemekFiyat.text = "\(toplamFiyat!)₺"
        labelYemekAd.text = sepet.yemek_adi
        labelYemekAdet.text = "Adet: \(sepet.yemek_siparis_adet!)"
        if let yra = sepet.yemek_resim_adi{
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
