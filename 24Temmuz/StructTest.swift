//
//  StructTest.swift
//  24Temmuz
//
//  Created by Kurumsal on 24.07.2023.
//

import Foundation

struct User {
    
    var name: String?
    var surname: String?
    var birthday: Int?
    var place: String?
    var newName: String?
    
    func calcAge(currentYear: Int) -> Int {
        guard let birth = self.birthday else {return 0}
        let age = currentYear - birth
        return age
    }
    
    func retirement() -> Int {
        guard let birth = self.birthday else {return 0}
        let date = Date()
        return 60 
    }
    init() {
        
    }
    init(place: String) {
        if place == "izmir" {
            self.surname = "izmirli"
        } else {
            self.surname = "efe"
        }
    }
    
}
