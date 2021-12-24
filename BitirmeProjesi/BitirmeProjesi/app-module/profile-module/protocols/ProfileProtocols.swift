//
//  ProfileProtocols.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import Foundation

protocol ViewToPresenterProfileProtocol{
    var profileInteractor: PresenterToInteractorProfileProtocol? {get set}
    var profileView: PresenterToViewProfileProtocol? {get set}
    func yemekleriYukle()
    
}
protocol PresenterToInteractorProfileProtocol{
    var profilePresenter: InteractorToPresenterProfileProtocol? {get set}
    func tumYemekleriYukle()
    
    
}
protocol InteractorToPresenterProfileProtocol{
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>)
}
protocol PresenterToViewProfileProtocol{
    func ViewaVeriGonder(yemeklerListesi: Array<Yemekler>)
}
protocol PresenterToRouterProfileProtocol{
    static func createModule(ref: ProfileVC)
}
protocol ProfileToGirisProcotol {
    func userDefaultDegistir()
}
