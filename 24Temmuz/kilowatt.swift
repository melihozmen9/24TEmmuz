//
//  kilowatt.swift
//  24Temmuz
//
//  Created by Kurumsal on 24.07.2023.
// hangi kullancıların hangi ürünleri kullandıgını gostericem.

import Foundation

struct Kwh {
    var urunAdı : String? // neden optional girdik?
    var mKwh : kilo?
    var yKwh : Double?

    init(urunAdı: String?,mKwh:kilo?) {
        self.urunAdı = urunAdı
        self.mKwh = mKwh
        guard let tempKwh = mKwh?.rawValue else {return}
        yKwh = tempKwh * 12
        //print(yKwh)
    }
}
