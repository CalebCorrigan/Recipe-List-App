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
}
