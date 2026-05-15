//
//  AuthService.swift
//  EasyVet
//
//  Created by Jorge Mayta on 14/05/26.
//

import Foundation

class AuthService {
    
    
    func login(email: String, password: String, completion: @escaping(User?) -> Void  ) {
        let endpoint = "https://petapi-591531460223.us-central1.run.app/api/users/login"
        
        let url = URL(string: endpoint)
        
        guard let url = url else {
            completion(nil)
            return
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        
        let loginRequestDto = LoginRequestDto(email: email, password: password)
        
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = try? JSONEncoder().encode(loginRequestDto)
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: urlRequest) { (data, response, error) in
            
            if error != nil {
                print("Error")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data")
                completion(nil)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else { return }
            
            do {
                let loginResponseDto = try JSONDecoder().decode(LoginResponseDto.self, from: data)
                let user = User(firstName: loginResponseDto.firstName,
                                lastName: loginResponseDto.lastName,
                                email: loginResponseDto.email)
                completion(user)
                
            } catch {
                print("Decoding error")
                completion(nil)
            }
        }
        
        task.resume()
    }
}
