//
//  MealDetailView.swift
//  Fetch Coding Challenge
//
//  Created by Ethan Derrick Pacleb on 7/23/24.
//

import SwiftUI

struct MealDetailView: View {
    @State var mealPicked: Meal
    @State var mealDetail: MealDetail
    @State var ingredients: [String:String] = [:]
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                        AsyncImage(url: URL(string: mealDetail.strMealThumb)) { image in
                            image.resizable()
                        } placeholder: {
                            Image("placeholder").resizable()
                            Text("Loading Image/Not Available...")
                        }.frame(width: 325, height: 325).clipShape(.rect(cornerRadius: 18))
                        VStack {
                            Text("Ingredients").bold().font(.largeTitle)
                            Spacer()
                            VStack {
                                ForEach(Array(ingredients.keys), id: \.self) { key in
                                    Text(ingredients[key]! + " " + key )
                                }
                            }
                    }
                    Spacer()
                    Spacer()
                    Text("Instructions").bold().font(.largeTitle)
                    Spacer()
                    Text(mealDetail.strInstructions)
                }.padding()
            }
        }.navigationBarTitleDisplayMode(.inline).navigationTitle(mealPicked.strMeal).task {
            await fetchMealDetails(mealURL: "https://themealdb.com/api/json/v1/1/lookup.php?i=" + mealPicked.idMeal)
            
            if let ingredient1 = mealDetail.strIngredient1, !ingredient1.isEmpty,
               let measure1 = mealDetail.strMeasure1, !measure1.isEmpty {
                ingredients[ingredient1] = measure1
            }

            if let ingredient2 = mealDetail.strIngredient2, !ingredient2.isEmpty,
               let measure2 = mealDetail.strMeasure2, !measure2.isEmpty {
                ingredients[ingredient2] = measure2
            }

            if let ingredient3 = mealDetail.strIngredient3, !ingredient3.isEmpty,
               let measure3 = mealDetail.strMeasure3, !measure3.isEmpty {
                ingredients[ingredient3] = measure3
            }

            if let ingredient4 = mealDetail.strIngredient4, !ingredient4.isEmpty,
               let measure4 = mealDetail.strMeasure4, !measure4.isEmpty {
                ingredients[ingredient4] = measure4
            }

            if let ingredient5 = mealDetail.strIngredient5, !ingredient5.isEmpty,
               let measure5 = mealDetail.strMeasure5, !measure5.isEmpty {
                ingredients[ingredient5] = measure5
            }

            if let ingredient6 = mealDetail.strIngredient6, !ingredient6.isEmpty,
               let measure6 = mealDetail.strMeasure6, !measure6.isEmpty {
                ingredients[ingredient6] = measure6
            }

            if let ingredient7 = mealDetail.strIngredient7, !ingredient7.isEmpty,
               let measure7 = mealDetail.strMeasure7, !measure7.isEmpty {
                ingredients[ingredient7] = measure7
            }

            if let ingredient8 = mealDetail.strIngredient8, !ingredient8.isEmpty,
               let measure8 = mealDetail.strMeasure8, !measure8.isEmpty {
                ingredients[ingredient8] = measure8
            }

            if let ingredient9 = mealDetail.strIngredient9, !ingredient9.isEmpty,
               let measure9 = mealDetail.strMeasure9, !measure9.isEmpty {
                ingredients[ingredient9] = measure9
            }

            if let ingredient10 = mealDetail.strIngredient10, !ingredient10.isEmpty,
               let measure10 = mealDetail.strMeasure10, !measure10.isEmpty {
                ingredients[ingredient10] = measure10
            }

            if let ingredient11 = mealDetail.strIngredient11, !ingredient11.isEmpty,
               let measure11 = mealDetail.strMeasure11, !measure11.isEmpty {
                ingredients[ingredient11] = measure11
            }

            if let ingredient12 = mealDetail.strIngredient12, !ingredient12.isEmpty,
               let measure12 = mealDetail.strMeasure12, !measure12.isEmpty {
                ingredients[ingredient12] = measure12
            }

            if let ingredient13 = mealDetail.strIngredient13, !ingredient13.isEmpty,
               let measure13 = mealDetail.strMeasure13, !measure13.isEmpty {
                ingredients[ingredient13] = measure13
            }

            if let ingredient14 = mealDetail.strIngredient14, !ingredient14.isEmpty,
               let measure14 = mealDetail.strMeasure14, !measure14.isEmpty {
                ingredients[ingredient14] = measure14
            }

            if let ingredient15 = mealDetail.strIngredient15, !ingredient15.isEmpty,
               let measure15 = mealDetail.strMeasure15, !measure15.isEmpty {
                ingredients[ingredient15] = measure15
            }

            if let ingredient16 = mealDetail.strIngredient16, !ingredient16.isEmpty,
               let measure16 = mealDetail.strMeasure16, !measure16.isEmpty {
                ingredients[ingredient16] = measure16
            }

            if let ingredient17 = mealDetail.strIngredient17, !ingredient17.isEmpty,
               let measure17 = mealDetail.strMeasure17, !measure17.isEmpty {
                ingredients[ingredient17] = measure17
            }

            if let ingredient18 = mealDetail.strIngredient18, !ingredient18.isEmpty,
               let measure18 = mealDetail.strMeasure18, !measure18.isEmpty {
                ingredients[ingredient18] = measure18
            }

            if let ingredient19 = mealDetail.strIngredient19, !ingredient19.isEmpty,
               let measure19 = mealDetail.strMeasure19, !measure19.isEmpty {
                ingredients[ingredient19] = measure19
            }

            if let ingredient20 = mealDetail.strIngredient20, !ingredient20.isEmpty,
               let measure20 = mealDetail.strMeasure20, !measure20.isEmpty {
                ingredients[ingredient20] = measure20
            }
        }
    }
    
    func fetchMealDetails(mealURL: String) async {
        guard let meal = URL(string: mealURL) else {
            print("Failed to create URL...")
            return
        }
        do {
            let (data, _) = try await URLSession.shared.data(from: meal)
            let json = try JSONDecoder().decode(MealDetailList.self, from:data)
            self.mealDetail = json.meals[0]
        } catch {
            print("Failed to parse JSON...")
        }
    }
}

#Preview {
    ContentView()
}
