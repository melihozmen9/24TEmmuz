//
//  StructClassViewController.swift
//  24Temmuz
//
//  Created by Kurumsal on 24.07.2023.
//

import UIKit

class StructClassViewController: UIViewController {

    var userObject = User(place: "aydın")
    var userObject2 = User(place: "izmir")

    var userObject3 = User(place: "izmir")

     var userArray = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //class referans struct değer
        //Struct ürün adı. aylık kilwatt saat değer ve yıllık değeri. init veya func ile hesaplıcaz. aylıgı hesapla ve yıla ata.
       
        userObject3.name = "Tarik"
        userObject3.surname = "Efe"
        userObject3.birthday = 1999
        
        var array2: [User] = [userObject ]
        userArray.append(userObject2)
        //cağırdıgında otomatik olarak cagrılan şey init metodu. bu teikleme default olarak nil tanımlanır. ya da optional ya da direkt değer verirsin. ilk çalışan sey init(). init'in kendisi ilk çaışan sey. o yüzden kullanılmayınca hata veriyor.
        
        guard let obj = userArray.first else {return}
        
        guard let name = obj.name, let surname = obj.surname, let birthday = obj.birthday else {return}
        
        
        let age = userObject2.calcAge(currentYear: 2023)
        print(userObject3.surname!)
    }
    


}
