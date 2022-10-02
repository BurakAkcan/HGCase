//
//  AppError.swift
//  HGCase
//
//  Created by Burak AKCAN on 3.09.2022.
//

import Foundation

enum AppError:LocalizedError{
    case invalidUrl
    case unableToComplete
    case invalidResponse
    case invalidData
    case errorDecoding
    
    var errorDescription: String?{
        switch self {
        case .invalidUrl:
            return "Invalid url"
        case .unableToComplete:
            return "Unable to complete your request"
        case .invalidResponse:
            return "Invalid response from server"
        case .invalidData:
            return "The data received from server was invalid"
        case .errorDecoding:
            return "The data could not decode"
        }
    }
}
