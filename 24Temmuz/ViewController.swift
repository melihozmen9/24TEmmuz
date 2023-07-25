//
//  ViewController.swift
//  24Temmuz
//
//  Created by Kurumsal on 24.07.2023.
//

import UIKit

class ViewController: UIViewController {
    // stringde append kullanılır.
    //
    var name = "bilge adam"
    var emptyString = "" //
    var emptyString2 = String() // string oluşturulmuştur. ama içi boş.
    var optionalStirng: String? // sadece tipi belirtilmiştir.
    var chars: [Character] = ["a","p","p","l","e"]
    
    var findIndex = "Günaydın! Herkese"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(emptyString.isEmpty)
        print(emptyString2.isEmpty)
        print(emptyString2)
        print(String(chars))
        var filtered = name.dropFirst().map{$0 == "a"}
        print(filtered)
        
        print(findIndex[findIndex.startIndex])
        
        let index = findIndex.index(findIndex.startIndex, offsetBy: 6)
        print(findIndex[index])
        let removed = findIndex.remove(at: index)
        print(findIndex)
        findIndex.insert("ı", at: index)
        print(findIndex)
        
        let index2 = findIndex.firstIndex(of: "!") ?? findIndex.endIndex

        let subString = findIndex[..<index2]
        print(subString)
        print(findIndex.uppercased())
        print(findIndex.uppercased(with: Locale(identifier: "tr_TR")))
        
        print(findIndex.replacingOccurrences(of: "e", with: "a"))
    }
    
    


}

