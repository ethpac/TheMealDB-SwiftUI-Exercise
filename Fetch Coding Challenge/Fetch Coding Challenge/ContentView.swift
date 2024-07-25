//
//  ContentView.swift
//  Fetch Coding Challenge
//
//  Created by Ethan Derrick Pacleb on 7/19/24.
//

import SwiftUI

struct ContentView: View {
    @State var desserts = MealList()
    
    var body: some View {
        NavigationStack {
            List(desserts.meals) { dessert in
                NavigationLink (dessert.strMeal, destination: MealDetailView(mealPicked: dessert, mealDetail: MealDetail()))
            }
                .navigationTitle("Desserts")
                .task {
                    desserts.meals = await fetchMeals(mealURL: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert")
            }
        }
    }
    
    func fetchMeals(mealURL: String) async -> [Meal] {
        guard let meals = URL(string: mealURL) else {
            print("Failed to create URL...")
            return []
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: meals)
            let json = try JSONDecoder().decode(MealList.self, from:data)
            return json.meals
        } catch {
            print("Failed to parse JSON...")
        }
        return []
    }
}

#Preview {
    ContentView()
}
