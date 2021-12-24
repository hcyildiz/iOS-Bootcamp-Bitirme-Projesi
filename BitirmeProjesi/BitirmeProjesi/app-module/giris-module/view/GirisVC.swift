//
//  ViewController.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import UIKit

class GirisVC: UIViewController {

    @IBOutlet weak var kayit: UIButton!
    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var tfKullaniciAd: UITextField!
    var girisPresenterNesnesi : ViewToPresenterGirisProtocol?
    var ud = UserDefaults.standard
    var kullanici : Kullanicilar?
    override func viewDidLoad() {
        super.viewDidLoad()
        GirisRouter.createModule(ref: self)
        self.navigationItem.title = "Üye Girişi"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor:UIColor.systemBackground,NSAttributedString.Key.font : UIFont(name: "Rokkitt-Medium", size: 22)!]
        appearence.backgroundColor = UIColor(named: "girisBtColor")
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        if ud.bool(forKey: "isLogin"){
            girisPresenterNesnesi?.giris(kullanici_ad: ud.string(forKey: "kullanici_adi")!)
        }
        configureTextFields()
        kayit.layer.borderWidth = 1
        kayit.layer.borderColor = UIColor(named: "girisBtColor")?.cgColor
        tfKullaniciAd.layer.borderColor = UIColor(named: "txFieldColor")?.cgColor
        tfKullaniciAd.layer.borderWidth = 1
        tfKullaniciAd.attributedPlaceholder = NSAttributedString(string: "Kullanıcı Adı",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "txFieldTextColor")!])
        tfSifre.layer.borderColor = UIColor(named: "txFieldColor")?.cgColor
        tfSifre.layer.borderWidth = 1
        tfSifre.attributedPlaceholder = NSAttributedString(string: "Şifre",attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "txFieldTextColor")!])
        
    }
    
    func configureTextFields(){
        tfKullaniciAd.leftViewMode = .always
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let image = UIImage(named: "person" )
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        imageView.image = image
        tfKullaniciAd.leftView = imageView
        tfSifre.leftViewMode = .always
        let passImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let passImage = UIImage(named: "pass" )
        passImageView.translatesAutoresizingMaskIntoConstraints = false
        passImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        passImageView.image = passImage
        tfSifre.leftView = passImageView
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toProfile"{
            let kullanici = sender as? Kullanicilar
            let gidilecekVC = segue.destination as! ProfileVC
            gidilecekVC.kullanici = kullanici
            gidilecekVC.userDefaultNesnesi = self
        }
    }

   
    @IBAction func buttonGirisYap(_ sender: Any) {
        if let ka = tfKullaniciAd.text, let _ = tfSifre.text {
            
            self.girisPresenterNesnesi?.giris(kullanici_ad: ka)
            
        }
        
    }
    
}
extension GirisVC : PresenterToViewGirisProtocol{
    func viewaVeriGonder(kullanici: Kullanicilar) {
        self.kullanici = kullanici
        if ud.bool(forKey: "isLogin") == false{
            if kullanici.kullanici_sifre == tfSifre.text! {
                ud.set(true, forKey: "isLogin")
                ud.set(kullanici.kullanici_ad, forKey: "kullanici_adi")
                performSegue(withIdentifier: "toProfile", sender: kullanici)
                tfKullaniciAd.text = ""
                tfSifre.text = ""
            }else{
                let alertController = UIAlertController(title: "Hatalı Şifre", message: "Girilen şifre yanlış!", preferredStyle: .alert)
                let kAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                    print("Tamam tıklandı")
                }
                alertController.addAction(kAction)
                self.present(alertController, animated: true)
            }
        }else{
            performSegue(withIdentifier: "toProfile", sender: kullanici)
        }
        
    }
    
    
}
extension GirisVC : ProfileToGirisProcotol{
    func userDefaultDegistir() {
        ud.set(false, forKey: "isLogin")
        ud.set("", forKey: "kullanici_adi")
    }
    
    
}
