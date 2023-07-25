//
//  ViewController.swift
//  elektrikHesapla
//
//  Created by Kullanici on 24.07.2023.
//

import UIKit

class TestViewController: UIViewController, DevletVergi {
  
    var userNAmes = ["kaan","mahmut","tarik","ferdi"]
    
    var trtClass = TRTClass()
   
    var productArray: [Kwh] = [Kwh(urunAdı: "TV", mKwh: .TV),
                               Kwh(urunAdı: "clima", mKwh: .clima),
                               Kwh(urunAdı: "Bulaşık Makinası", mKwh: .Bulaşık),
                               Kwh(urunAdı: "kettle", mKwh: .kettle)]
    
    var usersArray: [UserUsage] = [ UserUsage(username:"Melih", products: [Kwh(urunAdı: "TV", mKwh: .TV)],kullanimTipi: .individual),
                                    UserUsage(username: "Elif", products: [Kwh(urunAdı: "Bulaşık Makinası", mKwh: .Bulaşık),
                                                                           Kwh(urunAdı: "kettle", mKwh: .kettle)], kullanimTipi: .commercial),
                                    UserUsage(username:"kaan", products: [Kwh(urunAdı: "TV", mKwh: .TV),
                                                                          Kwh(urunAdı: "clima", mKwh: .clima),
                                                                          Kwh(urunAdı: "kettle", mKwh: .kettle)], kullanimTipi: .industry),
                                    UserUsage(username: "emirhan", products: [Kwh(urunAdı: "Bulaşık Makinası", mKwh: .Bulaşık),
                                                                              Kwh(urunAdı: "kettle", mKwh: .kettle)], kullanimTipi: .industry)
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        trtClass.TRTBaskani = self
        kilowattYazdır()
        kullaniciEkle()
        kullaniciYazdir()
      
    }
//    func calcElectricityUsage(unitPrice:BirimFiyat){
//       let people = usersArray
//        people.forEach({ member in
//            var monthlyUsage = 0.0
//           let products = member.products
//
//            products.forEach({ item in
//                guard let monthly = item.mKwh?.rawValue else {return}
//                monthlyUsage += monthly
//            })
//         let usageType = member.kullanimTipi
//
//            switch usageType {
//            case .individual:
//                let totalPriceWithServiceFee = monthlyUsage * usageType.rawValue
//                if monthlyUsage <= 240 {
//                   let unitPrice =  monthlyUsage * BirimFiyat.under240kwh.rawValue
//                    let totalPiceExVat = unitPrice + totalPriceWithServiceFee
//                    let totalPrice = totalPiceExVat * 1.2
//                } else {
//                    monthlyUsage * BirimFiyat.more240kwh.rawValue
//                }
//            default:
//                <#code#>
//            }
//
//        })
//    }
    func kilowattYazdır() {
        productArray.forEach { urun in
            guard let urunName = urun.urunAdı, let urunYillik = urun.yKwh else {return}
            print(urunName,urunYillik)
        }
    }
    func kullaniciEkle() {
        for _ in 0...3 {
            usersArray.append(UserUsage(username: userNAmes.randomElement(), products: [productArray[Int.random(in: 2...3)],productArray[Int.random(in: 0...1)]], kullanimTipi: .random() ))
        }
        
    }
    func kullaniciYazdir() {
       // ürünleri tek bir string yazdır. keza ismlerini de tek bir
        usersArray.forEach { user in
            var aylikToplam = Double()
            var yillikToplam = Double()
            var productsString = String()
            //kullanıcı ismi alma
            guard let username = user.username else {return}
            //usageType al
            var type = user.kullanimTipi.rawValue
            let typeString = user.kullanimTipi
            let userProducts = user.products
            // products Alma
            userProducts.forEach { product in
                guard let productName = product.urunAdı else {return}
                productsString += ",\(productName.uppercased())"
                guard let productMonth = product.mKwh?.rawValue, let productYear = product.yKwh else {return}
                aylikToplam += productMonth
                yillikToplam += productYear
            }
          
        
            let birim = birimHesapla(type: typeString, aylikKWH: aylikToplam)
            let faturaKisi = faturaHesapla(birimFiyat: birim, type: typeString, aylikKWH: aylikToplam)
            let finalFatura = trtPayiEkle(fatura: faturaKisi)
            
            print("""
                  Kullanici ismi: \(username.uppercased())
                  Kullandıgı ürün/ürünler: \(productsString.dropFirst())
                  Aylık kullandıgı miktar: \(aylikToplam)
                  Yıllık kullandıgı miktar: \(yillikToplam)
                  Kullanım Tipi: \(typeString)
                  Aylık elektirik faturası: \(faturaKisi)
                  TRT payı eklenmiş Aylık elektirik faturası: \(finalFatura)
                  -----------------------------------------
                  """)
            
        }
        
    }
    func birimHesapla(type:kullanimTipi,aylikKWH:Double) -> BirimFiyat{
        var birim: BirimFiyat
        switch type {
        case .individual:
            if aylikKWH < 240.0 {
                birim = .under240kwh
            } else {
                birim = .more240kwh
            }
        case .commercial:
            if aylikKWH < 900.0 {
                birim = .under900kwh
            } else {
                birim = .more900kwh
            }
        case .industry:
            birim = .standard
            
        }
        return birim
    }
    
    func faturaHesapla(birimFiyat: BirimFiyat,type:kullanimTipi,aylikKWH:Double) -> Double {
        var fatura = Double()
        switch type {
        case .industry:
            if aylikKWH < 900.0 {
                fatura = calculate(birimFiyat: birimFiyat, MontlyUsage: aylikKWH, type: type)
            }else {
                fatura = calculate(birimFiyat: birimFiyat, MontlyUsage: aylikKWH, type: type)
            }
            
        case .individual:
            if aylikKWH < 240.0 {
                fatura = calculate(birimFiyat: birimFiyat, MontlyUsage: aylikKWH, type: type)
            }else {
                fatura = calculate(birimFiyat: birimFiyat, MontlyUsage: aylikKWH, type: type)
            }
        case .commercial:
            fatura = calculate(birimFiyat: birimFiyat, MontlyUsage: aylikKWH, type: type)
            
        }
        return fatura
        
    }
    
    func trtPayiEkle(fatura:Double) -> Double{
        let trtNewPayi = trtClass.process(fatura: fatura)
        return trtNewPayi
    }
    
    func calculate(birimFiyat:BirimFiyat,MontlyUsage:Double,type:kullanimTipi) -> Double {
        var fatura = ((MontlyUsage * birimFiyat.rawValue) + (MontlyUsage * type.rawValue)) * 1.2
        return fatura
    }
    
}

enum kilo: Double {
    case TV = 6.5
    case kettle = 12.5
    case Bulaşık = 22.0
    case clima = 12.0
}

// user struct içinde userların aylık ve yıllık tütketimlerini belirt. bizim userların kullanıcıları listele.
enum kullanimTipi: Double, CaseIterable {
    case individual = 0.50
    case commercial = 0.75
    case industry = 1.1
    
    static func random() -> kullanimTipi {
        return allCases.randomElement()! // safe to force unwrap, since the enum has at least 1 property, so this can never be `nil`
    }
}
enum BirimFiyat:Double {
    case under240kwh = 0.55
    case more240kwh = 1.20
    case under900kwh = 1.53
    case more900kwh = 2.30
    case standard = 2.55
}


