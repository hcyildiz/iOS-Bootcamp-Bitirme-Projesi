//
//  YemekTableViewCell.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import UIKit
import Kingfisher

class YemekTableViewCell: UITableViewCell {

    @IBOutlet weak var labelYemekFiyat: UILabel!
    @IBOutlet weak var labelYemekAd: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
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
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

    @IBAction func buttonSepeteEkle(_ sender: Any) {
    }
}
