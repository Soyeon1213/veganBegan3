//
//  DatabaseManager.swift
//  veganBegan
//
//  Created by RelMac User Exercise3 on 2021/05/16.
//  Copyright © 2021 Release. All rights reserved.
//

import Foundation
import Firebase
import FirebaseDatabase

class DatabaseManager {
    var ref: DatabaseReference! = Database.database(url: "https://veganbegan-6322d-default-rtdb.firebaseio.com/").reference()
    
    func updateRating(id: Int, rating: Int) {
        var ratingAvg: Double = 0.0
        var ratingCount: Int = 0
        self.ref.child("restaurant/\(id)").getData(completion: { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as? NSDictionary
                ratingAvg = value?["rating"] as? Double ?? 0.0
                ratingCount = value?["rating_count"] as? Int ?? 0
            }
            else {
                print("No data available")
            }
        })
        ratingCount += 1
        ratingAvg = (ratingAvg * (Double(ratingCount)-1) + Double(rating)) / Double(ratingCount)
        self.ref.child("restaurant/\(id)/rating").setValue(rating)
        self.ref.child("restaurant/\(id)/rating_count").setValue(ratingCount)
    }
    
    func test() {
        var testName: String = ""
        var testNum: Int = 0
        self.ref.child("restaurant/0").getData(completion: { (error, snapshot) in
            if let error = error {
                print("Error getting data \(error)")
            }
            else if snapshot.exists() {
                let value = snapshot.value as? NSDictionary
                testName = value?["name"] as? String ?? ""
                testNum = value?["num"] as? Int ?? 0
                print("Name: \(testName), Num: \(testNum)")
            }
            else {
                print("No data available")
            }
        })
    }
}
