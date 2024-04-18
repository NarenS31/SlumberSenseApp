//
//  Analysis.swift
//  SlumberSense
//
//  Created by Saravanan Saminathan on 4/17/24.
//

import Foundation



struct Analysis: Identifiable {
    let id = UUID()
    var name : String?
    var sleepHoursComents: String?
    var alchoholComents: String?
    var smokingComents: String?
    var caffeineComents: String?
    var bedTime : Int?
    var wakeTime: Int?
    var ageOption: Int?
    
//    init(name: String?, sleepHoursComents: String? = nil, alchoholComents: String? = nil) {
//        self.name = busName
//        self.web = website
//        self.address = address
//    }
}

extension Analysis {
    static func all() -> Analysis {
        return Analysis(name : "Sara", sleepHoursComents: "trewt", alchoholComents: "ads", smokingComents: "Test", caffeineComents: "ads",bedTime: -1, wakeTime:  -1, ageOption: 4);
    }
}
