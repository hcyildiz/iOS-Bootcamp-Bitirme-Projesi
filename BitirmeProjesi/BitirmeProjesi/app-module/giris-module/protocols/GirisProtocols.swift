//
//  GirisProtocols.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

protocol ViewToPresenterGirisProtocol{
    var girisInteractor : PresenterToInteractorGirisProtocol? {get set }
    var girisView : PresenterToViewGirisProtocol? {get set}
    func giris(kullanici_ad:String)
}
protocol PresenterToInteractorGirisProtocol{
    var girisPresenter : InteractorToPresenterGirisProtocol? { get set}
    func girisYap(kullanici_ad:String)
}
protocol InteractorToPresenterGirisProtocol{
    func presenteraVeriGonder(kullanici:Kullanicilar)
}
protocol PresenterToViewGirisProtocol{
    func viewaVeriGonder(kullanici:Kullanicilar)
}
protocol PresenterToRouterGirisProtocol{
    static func createModule(ref:GirisVC)
}
