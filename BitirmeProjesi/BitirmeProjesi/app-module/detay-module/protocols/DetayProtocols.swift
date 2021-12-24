//
//  DetayProducts.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

protocol ViewToPresenterDetayProtocol{
    var detayInteractor: PresenterToInteractorDetayProtocol? {get set}
    func sepet(yemek:Yemekler,adet:Int,kullanici_ad:String)
}
protocol PresenterToInteractorDetayProtocol{
    func sepeteEkle(yemek:Yemekler,adet:Int,kullanici_ad:String)
}

protocol PresenterToRouterDetayProtocol{
    static func createModule(ref:DetayVC)
}
