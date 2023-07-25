//
//  TRTClass.swift
//  24Temmuz
//
//  Created by Kurumsal on 25.07.2023.
//

import Foundation

class TRTClass {
    var TRTBaskani: DevletVergi?
    var trtPayi = 1.02
    
    func process(fatura:Double) -> Double {// bunu ilk burada tanımlıyorsun. dolayısıyla diğer yerde cagırdıgında istediğin veriyi içine koyabilieceksin.
        let pay = TRTBaskani?.trtPayi(trtPayi: trtPayi,fatura: fatura)// buradaki iki veriden birini zaten aynı classdaki veriden alıyor. diğerini func processten alıyor. 
        return pay!
    }
    
}
