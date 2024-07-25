//
//  Meal.swift
//  Fetch Coding Challenge
//
//  Created by Ethan Derrick Pacleb on 7/21/24.
//

import Foundation
class Meal : Identifiable, Decodable {
    var idMeal: String
    var strMeal: String

    init(id: String, mealName: String, mealPic: String) {
        self.idMeal = id
        self.strMeal = mealName
    }
}
