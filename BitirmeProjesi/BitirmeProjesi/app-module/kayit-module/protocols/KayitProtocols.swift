//
//  KayitProtocols.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

protocol ViewToPresenterKayitProtocol{
    var kayitInteractor : PresenterToInteractorKayitProtocol? { get set}
    var kayitView : PresenterToViewKayitProtocol? {get set}
    func kayit(kullanici_ad:String,kullanici_sifre:String,kullanici_email:String)
}
protocol PresenterToInteractorKayitProtocol{
    var kayitPresenter: InteractorToPresenterKayitProtocol? {get set}
    func kayitOl(kullanici_ad:String,kullanici_sifre:String,kullanici_email:String)
}
protocol InteractorToPresenterKayitProtocol {
    func presenteraVeriGonder(bool: Bool)
}
protocol PresenterToViewKayitProtocol {
    func viewaVeriGonder(bool:Bool)
}
protocol PresenterToRouterKayitProtocol{
    static func createModule(ref:KayitVC)
}


