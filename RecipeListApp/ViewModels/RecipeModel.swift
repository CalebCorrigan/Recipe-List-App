//
//  RecipeModel.swift
//  RecipeListApp
//
//  Created by Caleb Corrigan on 6/27/22.
//

import Foundation

class RecipeModel: ObservableObject {
    
    @Published var recipes = [Recipe]()
    
    init(){
        
        //create instance of data service and get the data 
        self.recipes = DataSevice.getLocalData()
    }
    
    static func getPortion(ingredient:Ingredients, recipeServings:Int, targetServings:Int) -> String {
        
        var portion = ""
        var numerator = ingredient.num ?? 1
        var denominator = ingredient.denom ?? 1
        var wholePortions = 0
        
        if ingredient.num != nil {
            //Get a single serving size by multiplying denomator by recipe servings
            denominator *= recipeServings
            
            //Get Target portion by multpiy numerator by target servings
            numerator *= targetServings
            
            //Reduce Fraction by greatest common divsor
            let divisor = Rational.greatestCommonDivisor(numerator, denominator)
            numerator /= divisor
            denominator /= divisor
            
            //Get the whole portion if numeraotr > denominator
            if numerator >= denominator {
                
                //Calculated Whole Portions
                wholePortions = numerator / denominator
                
                //Calculate Remainder
                numerator = numerator % denominator
                
                //Asign to portion string
                portion += String(wholePortions)
            }
            
            
            //Express the remander as a fraction
            if numerator > 0 {
                
                //Assign rremsinder as fraction to the pprtion string
                portion += wholePortions > 0 ? " " : " "
                portion += "\(numerator)/\(denominator)"
            }
            
            
        }
        
        if var unit = ingredient.unit {
            
            var suffix = ""
            if wholePortions > 1 {
                
            //Calculate appropritate suffix
            if unit.suffix(2) == "ch" {
                unit += "es"
                
            }
                else if unit.suffix(1) == "f" {
                    unit = String(unit.dropLast())
                    unit += "s"
                }
                else {
                    unit += "s"
                }
            }
            portion += ingredient.num == nil && ingredient.denom == nil ? " " : " "
            
            return portion + unit
        }
        
        return portion
    }
    
}
