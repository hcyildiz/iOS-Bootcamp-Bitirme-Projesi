//
//  SepetProtocols.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import Foundation

protocol ViewToPresenterSepetProtocol{
    var sepetInteractor: PresenterToInteractorSepetProtocol? {get set}
    var sepetView: PresenterToViewSepetProtocol? {get set}
    func sepet(kullanici_ad:String)
    func sil(kullanici_ad:String,urun_id:Int)
    func temizle(kullanici_ad:String,urun_id: Array<Int>)
}

protocol PresenterToInteractorSepetProtocol{
    var sepetPresenter: InteractorToPresenterSepetProtocol? {get set}
    func sepetListele(kullanici_ad:String)
    func sepetSil(kullanici_ad:String,urun_id:Int)
    func sepetTemizle(kullanici_ad:String,urun_id: Array<Int>)
}

protocol InteractorToPresenterSepetProtocol{
    func presenteraVeriGonder(sepetListe:Array<Sepet>)
}

protocol PresenterToViewSepetProtocol{
    func viewaVeriGonder(sepetListe:Array<Sepet>)
}

protocol PresenterToRouterSepetProtocol{
    static func createModule(ref:SepetVC)
}
