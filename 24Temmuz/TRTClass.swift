//
//  TRTClass.swift
//  24Temmuz
//
//  Created by Kurumsal on 25.07.2023.
//

import Foundation

class TRTClass {
    var tayyip: DevletVergi?
    var trtPayi = 1.02
    
    func process() -> Double {
        let pay = tayyip?.trtPayi(trtPayi: trtPayi)
        return pay!
    }
    
}
