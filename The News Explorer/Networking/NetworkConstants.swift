//
//  NetworkConstants.swift
//  The News Explorer
//
//  Created by Yeasir Arefin Tusher on 26/1/23.
//
import Foundation

class NetworkConstants {
    
    public static var shared: NetworkConstants = NetworkConstants()
    
    public var apiKey: String {
        get {
            
            return "e7f8e02bc02d4ef2a0c3e53a09c9e3b5"
        }
    }
    
    public var apiEndPoint: String {
        get {
            return "https://newsapi.org/v2/top-headlines?country=us&apiKey="
        }
    }
    
   
}
