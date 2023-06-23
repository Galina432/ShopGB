//
//  AbstractErrorParser.swift
//  ShopGB
//
//  Created by Irina on 20.06.2023.
//

import Foundation

// протокол занимается обработкой ошибок

protocol AbstractErrorParser {
    func parse(_ result: Error) -> Error // ошибки
    func parse(response: HTTPURLResponse?, data: Data?, error: Error?) -> Error? // данные
    
}
