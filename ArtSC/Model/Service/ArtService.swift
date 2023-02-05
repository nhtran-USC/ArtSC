//
//  ArtService.swift
//  ArtSC
//
//  Created by Nguyen Tran on 2/4/23.
//

import Foundation

class ArtService {
    let BASE_URL = "http://localhost:8000/social/api/get_posts_for_category/?category_id="
    static let shared = ArtService()
    var artResponse:ArtResponse?
//    var parameters = ["category_id": ""]
    private init(){
        
    }
    
    func fetchArtReponseByCategory(id:Int, completionHandler:@escaping ()->Void) {
        
        guard let url = URL(string: BASE_URL + String(id)) else { return }
        var request = URLRequest(url: url)
        guard let token = UserService.shared.user?.token else {
            return
        }
        
//        parameters["category_id"] = String(id)
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
//
//        } catch {
//            print(error.localizedDescription)
//        }
        
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
                try ArtService.shared.artResponse = decoder.decode(ArtResponse.self, from: data)
            }
            catch {
                fatalError(error.localizedDescription)
            }
            
            DispatchQueue.main.async{
                completionHandler()
            }
        }.resume()
    }
    
    
}
