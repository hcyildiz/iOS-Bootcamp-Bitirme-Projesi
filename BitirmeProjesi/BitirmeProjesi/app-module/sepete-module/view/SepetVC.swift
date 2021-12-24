//
//  SepetVC.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 9.12.2021.
//

import UIKit

class SepetVC: UIViewController {

    @IBOutlet weak var sepetTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var sepetTutarLabel: UILabel!
    
    var kullanici: String?
    var sepetListe = [Sepet]()
    var sepetPresenterNesnesi: ViewToPresenterSepetProtocol?
    var filteredSepetListesi = [Sepet]()
    var toplam: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        sepetTableView.delegate = self
        sepetTableView.dataSource = self
        searchBar.delegate = self
        SepetRouter.createModule(ref: self)
        self.navigationItem.title = "Sepetim"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor:UIColor.systemBackground,NSAttributedString.Key.font : UIFont(name: "Rokkitt-Medium", size: 22)!]
        appearence.backgroundColor = UIColor(named: "girisBtColor")
        navigationController?.navigationBar.tintColor = UIColor.systemBackground
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterNesnesi?.sepet(kullanici_ad: kullanici!)
        self.sepetTableView.reloadData()
    }
    
    @IBAction func buttonSepetSil(_ sender: Any) {
        let alert = UIAlertController(title: "Silme İşlemi", message: "Sepetteki tüm ürünleri silmek istiyor musun?", preferredStyle: .alert)
        let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
            
        }
        alert.addAction(iptalAction)
        let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
            var urunIdListe = [Int]()
            for i in self.filteredSepetListesi {
                urunIdListe.append(Int(i.sepet_yemek_id!)!)
            }
            self.sepetPresenterNesnesi?.temizle(kullanici_ad: self.kullanici!, urun_id: urunIdListe)
            let vc = self.navigationController?.viewControllers[1]
            self.navigationController?.popToViewController(vc!, animated: true)
        }
        alert.addAction(evetAction)
        self.present(alert, animated: true)
    }
    
    @IBAction func buttonYemekListesi(_ sender: Any) {
        let vc = self.navigationController?.viewControllers[1]
        navigationController?.popToViewController(vc!, animated: true)
    }
}

extension SepetVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredSepetListesi.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepet = filteredSepetListesi[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "sepetHucre", for: indexPath) as! SepetTableViewCell
        hucre.setData(sepet: sepet)
        hucre.selectionStyle = .none
        return hucre
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            
            let yemek = self.filteredSepetListesi[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yemek.yemek_adi!) silinsin mi?", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İptal", style: .cancel){ action in
                
            }
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "Evet", style: .destructive){ action in
                self.sepetPresenterNesnesi?.sil(kullanici_ad: self.kullanici!, urun_id: Int(yemek.sepet_yemek_id!)!)
            }
            alert.addAction(evetAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}

extension SepetVC: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredSepetListesi = []
        if searchText.isEmpty {
            filteredSepetListesi = self.sepetListe
        }
        for yemek in sepetListe {
            guard let yemekAdi = yemek.yemek_adi else {return}
            
            if yemekAdi.lowercased().contains(searchText.lowercased()){
                filteredSepetListesi.append(yemek)
            }
        }
        self.sepetTableView.reloadData()
    }
}

extension SepetVC: PresenterToViewSepetProtocol {
    func viewaVeriGonder(sepetListe: Array<Sepet>) {
        self.sepetListe = sepetListe
        self.filteredSepetListesi = sepetListe
        DispatchQueue.main.async {
            self.sepetTableView.reloadData()
        }
        toplam = 0
        for i in sepetListe {
            toplam = toplam + Int(i.yemek_fiyat!)! * Int(i.yemek_siparis_adet!)!
        }
        sepetTutarLabel.text = "SEPET TUTARI: \(toplam) ₺"
    }
}
