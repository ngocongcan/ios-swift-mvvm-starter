//
//  Users.swift
//  ios-swift-mvvm-starter
//
//  Created by Hulk on 06/08/2021.
//

import Foundation

struct User: Decodable {

    let id: Int;
    let login: String;
    let avatar_url: String;
    let html_url: String?
    
    let name: String?;
    let location: String?;
    let bio: String?
    let public_repos: Int?;
    let followers: Int?;
    let following: Int?;

}
