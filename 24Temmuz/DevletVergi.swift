//
//  DevletVergi.swift
//  24Temmuz
//
//  Created by Kurumsal on 25.07.2023.
//

import Foundation

protocol DevletVergi {
    func trtPayi(trtPayi: Double,fatura:Double) -> Double
}

extension DevletVergi {
    func trtPayi(trtPayi: Double,fatura:Double) -> Double {
        let trtPayliHali = fatura * trtPayi
        return trtPayliHali
    }
}
