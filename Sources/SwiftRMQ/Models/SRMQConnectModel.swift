//
//  File.swift
//  
//
//  Created by Александр Сенин on 25.02.2022.
//

import Foundation

public struct SRMQConnectModel{
    public var host: String
    public var port: Int32
    
    public init(host: String, port: Int32){
        self.host = host
        self.port = port
    }
}
