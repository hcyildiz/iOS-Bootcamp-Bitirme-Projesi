//
//  DetayVC.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import UIKit
import Kingfisher
class DetayVC: UIViewController {
    @IBOutlet weak var urunFiyatLabel: UILabel!
    @IBOutlet weak var urunAdLabel: UILabel!
    @IBOutlet weak var adetLabel: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var imgView: UIImageView!
    
    var yemek : Yemekler?
    var kullanici : Kullanicilar?
    var detayPresenterNesnesi: ViewToPresenterDetayProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Sipariş Ekle"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor:UIColor.systemBackground,NSAttributedString.Key.font : UIFont(name: "Rokkitt-Medium", size: 22)!]
        appearence.backgroundColor = UIColor(named: "girisBtColor")
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        if let y = yemek{
            resimGoster(resimAdi: y.yemek_resim_adi!)
            urunAdLabel.text = y.yemek_adi
            urunFiyatLabel.text = "\(y.yemek_fiyat!) ₺"
        }
        DetayRouter.createModule(ref: self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSepet"{
            let kullanici = sender as? String
            let gidilecekVC = segue.destination as! SepetVC
            gidilecekVC.kullanici = kullanici
        }
    }
    
    func resimGoster(resimAdi:String){
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(resimAdi)"){
            DispatchQueue.main.async {
                self.imgView.kf.setImage(with: url)
            }
            
        }
    }
    
    @IBAction func buttonSepeteEkle(_ sender: Any) {
        if let y = yemek, let k = kullanici{
            detayPresenterNesnesi?.sepet(yemek: y, adet: Int(stepper.value), kullanici_ad: k.kullanici_ad! )
            performSegue(withIdentifier: "toSepet", sender: k.kullanici_ad)
        }
        
    }
    
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        adetLabel.text = "Adet: \(Int(sender.value))"
        if let y = yemek {
            let intFiyat = Int(y.yemek_fiyat!)
            let toplamFiyat = intFiyat! * Int(sender.value)
            urunFiyatLabel.text = "\(toplamFiyat) ₺"
        }
    }
    
}
