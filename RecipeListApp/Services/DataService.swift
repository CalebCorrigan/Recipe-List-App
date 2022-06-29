//
//  DataService.swift
//  RecipeListApp
//
//  Created by Caleb Corrigan on 6/27/22.
//

import Foundation

//resobnsible for all stat fetching

class DataSevice {
    
    static func getLocalData() -> [Recipe] {
        
        //Parse Local json File
        
        //Get a url path to the json file
        let pathstring = Bundle.main.path(forResource: "recipes" , ofType: "json")
        
        //Guard statement is checking if pathstring is not nil
        guard pathstring != nil else {
            return [Recipe]()
        }
        //create url object
        let url = URL(fileURLWithPath: pathstring!)
        
        do {
            //create a data object
            let data = try Data(contentsOf: url)
            
            //decode the data with a JSON decoder
            let decoder = JSONDecoder()
            
            do {
                let recipeData = try decoder.decode([Recipe].self, from: data)
                
                
                //add unique IDs
                for r in recipeData {
                    r.id = UUID()
                }
                
                
                
                //Return the recipes
                return recipeData
            }
            catch {
                print(error)
            }
        
            
           
        }
        catch{
            //error with getting data
            print(error)
            
        }
       
        return [Recipe]()
        
    }
}
