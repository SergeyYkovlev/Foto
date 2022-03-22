//
//  Models.swift
//  Foto
//
//  Created by Сергей Яковлев on 21.03.2022.
//

import UIKit

final class Photos: Decodable {
    var id: String
    var width: Int
    var height: Int
    var color: String
    var user: User
    var urls: Urls
    var uiColor: UIColor? {
        return .init(named: color)
    }
}

final class User: Decodable {
    var name: String
}

final class Urls: Decodable {
    var raw: String
    var full: String
    var regular: String
    var small: String
    var thumb: String
}
