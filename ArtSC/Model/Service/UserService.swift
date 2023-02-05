import Foundation
class UserService {
    static let shared = UserService()
    var user: User?
    
    private init () {
    }
    
    func fetchUser(data: Data) {
        let decoder = JSONDecoder()
        do{
            try user = decoder.decode(User.self, from: data)
        }
        catch {
            print(error)
        }
    }
}
