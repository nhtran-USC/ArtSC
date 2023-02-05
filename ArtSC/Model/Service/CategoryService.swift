//
//  CategoryService.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation


class CategoryService{
    let BASE_URL = "http://localhost:8000/social/api/get_categories/"
    static let shared = CategoryService()
    var categoryResponse:CategoryResponse?
    private init(){
        
    }
    
    func fetchCategoryResponse() {
        guard let url = URL(string: BASE_URL) else { return }
        var request = URLRequest(url: url)
        guard let token = UserService.shared.user?.token else {
            return
        }
        
        request.setValue("token " + token, forHTTPHeaderField: "Authorization")
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")


    

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }

            guard let data = data else { return }
            
            do{
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                print(json)
            }
            catch {
                print("no data")
            }
            
            
            let decoder = JSONDecoder()
            do{
                try CategoryService.shared.categoryResponse = decoder.decode(CategoryResponse.self, from: data)
            }
            catch {
                fatalError(error.localizedDescription)
            }
            
        }.resume()
    }
}
