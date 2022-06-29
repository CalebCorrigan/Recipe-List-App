//
//  Recipe.swift
//  RecipeListApp
//
//  Created by Caleb Corrigan on 6/27/22.
//

import Foundation

class Recipe: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var highlights:[String]
    var ingredients:[Ingredients]
    var directions:[String]
    
}

//This can be in a new swift file under the model folder
class Ingredients: Identifiable, Decodable {
    
    var id:UUID?
    var name:String
    var num:Int? //? becuase it is an option and we do not know if it will return a value
    var denom:Int?
    var unit:String?
}
