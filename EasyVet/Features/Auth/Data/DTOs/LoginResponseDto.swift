//
//  LoginResponseDto.swift
//  EasyVet
//
//  Created by Jorge Mayta on 14/05/26.
//

nonisolated struct LoginResponseDto: Decodable {
    let token: String
    let firstName: String
    let lastName: String
    let email: String
}
