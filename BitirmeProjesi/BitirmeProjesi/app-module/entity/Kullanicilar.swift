//
//  Kullanicilar.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

class Kullanicilar {
    var kullanici_id : String?
    var kullanici_ad : String?
    var kullanici_sifre : String?
    var kullanici_email : String?
    
    init(){
        
    }
    init(kulllanici_id:String,kullanici_ad:String,kullanici_sifre:String,kullanici_email:String){
        self.kullanici_id = kullanici_ad
        self.kullanici_ad = kullanici_ad
        self.kullanici_sifre = kullanici_sifre
        self.kullanici_email = kullanici_email
        
    }
    
}
