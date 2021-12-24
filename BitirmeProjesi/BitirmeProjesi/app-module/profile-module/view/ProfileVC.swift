//
//  ProfileVC.swift
//  BitirmeProjesi
//
//  Created by Hüseyin  YILDIZ on 8.12.2021.
//

import UIKit
import Kingfisher
class ProfileVC: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yemekTableView: UITableView!
    @IBOutlet weak var yemekCollectionView: UICollectionView!
    
    var kullanici: Kullanicilar?
    var userDefaultNesnesi: ProfileToGirisProcotol?
    var yemeklerListe = [Yemekler]()
    var filteredYemekListesi = [Yemekler]()
    var profilePresenterNesnesi : ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //yemekTableView.delegate = self
        //yemekTableView.dataSource = self
        yemekCollectionView.delegate = self
        yemekCollectionView.dataSource = self
        searchBar.delegate = self
        ProfileRouter.createModule(ref: self)
        self.navigationItem.title = "Yemekler"
        let appearence = UINavigationBarAppearance()
        appearence.titleTextAttributes = [.foregroundColor:UIColor.systemBackground,NSAttributedString.Key.font : UIFont(name: "Rokkitt-Medium", size: 22)!]
        appearence.backgroundColor = UIColor(named: "girisBtColor")
        navigationController?.navigationBar.tintColor = UIColor.systemBackground
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
        let genislik = yemekCollectionView.frame.size.width
        let tasarim = UICollectionViewFlowLayout()
        tasarim.minimumLineSpacing = 10
        tasarim.minimumInteritemSpacing = 10
        tasarim.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let itemGenislik = (genislik-30)/2
        tasarim.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.7)
        yemekCollectionView.collectionViewLayout = tasarim
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profilePresenterNesnesi?.yemekleriYukle()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let s = sender as? Array<Any>{
                let yemek = s[0] as? Yemekler
                let kullanici = s[1] as? Kullanicilar
                let gidilecekVC = segue.destination as! DetayVC
                gidilecekVC.yemek = yemek
                gidilecekVC.kullanici = kullanici
            }
        }
        
        if segue.identifier == "profileToSepet" {
            let kullanici = sender as? String
            let gidilecekVC = segue.destination as! SepetVC
            gidilecekVC.kullanici = kullanici
        }
    }
    
    @IBAction func sepetButton(_ sender: Any) {
        performSegue(withIdentifier: "profileToSepet", sender: kullanici?.kullanici_ad!)
    }
    @IBAction func buttonCikisYap(_ sender: Any) {
        userDefaultNesnesi?.userDefaultDegistir()
        navigationController?.popToRootViewController(animated: true)
    }
    
}
extension ProfileVC: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredYemekListesi.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let yemek = filteredYemekListesi[indexPath.row]
        let hucre = yemekCollectionView.dequeueReusableCell(withReuseIdentifier: "yemekHucre", for: indexPath) as! YemekCollectionViewCell
        hucre.setData(yemek: yemek)
        hucre.layer.cornerRadius = 10
        hucre.layer.borderColor = UIColor(named: "girisBtColor")?.cgColor
        hucre.layer.borderWidth = 1
        return hucre
    
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let yemek = filteredYemekListesi[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: [yemek, kullanici!])
        collectionView.deselectItem(at: indexPath, animated: true)
    }
}

extension ProfileVC : UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredYemekListesi = []
        if searchText.isEmpty {
            filteredYemekListesi = self.yemeklerListe
        }
        for yemek in yemeklerListe {
            guard let yemekAdi = yemek.yemek_adi else {return}
            
            if yemekAdi.lowercased().contains(searchText.lowercased()){
                filteredYemekListesi.append(yemek)
            }
        }
        yemekCollectionView.reloadData()
    }
}
extension ProfileVC : PresenterToViewProfileProtocol {
    func ViewaVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        self.filteredYemekListesi = yemeklerListesi
        DispatchQueue.main.async {
            self.yemekCollectionView.reloadData()
        }
    }
    
    
}
