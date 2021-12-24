//
//  KayitVC.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import UIKit

class KayitVC: UIViewController {

    @IBOutlet weak var tfEmail: UITextField!
    @IBOutlet weak var tfSifreTekrar: UITextField!
    @IBOutlet weak var tfSifre: UITextField!
    @IBOutlet weak var tfKullaniciAd: UITextField!
    var kayitPresenterNesnesi : ViewToPresenterKayitProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Kayıt Ol"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor:UIColor.systemBackground,NSAttributedString.Key.font : UIFont(name: "Rokkitt-Medium", size: 22)!]
        appearence.backgroundColor = UIColor(named: "girisBtColor")
        navigationController?.navigationBar.tintColor = UIColor.systemBackground
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        KayitRouter.createModule(ref: self)
        configureTextFields()

        
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
        
        tfEmail.leftViewMode = .always
        let emailImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let emailImage = UIImage(named: "email" )
        emailImageView.translatesAutoresizingMaskIntoConstraints = false
        emailImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        emailImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        emailImageView.image = emailImage
        tfEmail.leftView = emailImageView
        
        tfSifreTekrar.leftViewMode = .always
        let passAgainImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        let passAgainImage = UIImage(named: "pass" )
        passAgainImageView.translatesAutoresizingMaskIntoConstraints = false
        passAgainImageView.heightAnchor.constraint(equalToConstant: 30).isActive = true
        passAgainImageView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        passAgainImageView.image = passAgainImage
        tfSifreTekrar.leftView = passAgainImageView
    }
    
    @IBAction func buttonKayitOl(_ sender: Any) {
        if tfSifre.text == tfSifreTekrar.text {
            if let ka = tfKullaniciAd.text, let ks = tfSifre.text, let ke = tfEmail.text {
                kayitPresenterNesnesi?.kayit(kullanici_ad: ka, kullanici_sifre: ks, kullanici_email: ke)
            }
        }else{
            let alertController = UIAlertController(title: "Kayıt Başarısız", message: "Şifreler uyuşmuyor", preferredStyle: .alert)
            let kAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                
            }
            alertController.addAction(kAction)
            self.present(alertController, animated: true)
        }
        
        
    }
    


}
extension KayitVC: PresenterToViewKayitProtocol {
    func viewaVeriGonder(bool: Bool) {
        if bool {
            let alertController = UIAlertController(title: "Kayıt Başarılı", message: "Başarıyla Kayıt Olundu.", preferredStyle: .alert)
            let kAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alertController.addAction(kAction)
            self.present(alertController, animated: true)
            
        }else{
            let alertController = UIAlertController(title: "Kayıt Başarısız", message: "Kullanıcı adı başka bir kullanıcı tarafından alınmış.", preferredStyle: .alert)
            let kAction = UIAlertAction(title: "Tamam", style: .cancel){ action in
                print("Tamam tıklandı")
            }
            alertController.addAction(kAction)
            self.present(alertController, animated: true)
        }
    }
}
