//
//  File.swift
//  
//
//  Created by Александр Сенин on 25.02.2022.
//

import Foundation

public enum SRMQSaslMetod: Int{
    case undefined
    case plain
    case external
}

public struct SRMQLoginModel{
    public var vhost: String = "/"
    public var login: String = ""
    public var password: String = ""
    
    public var maxChannel: Int32 = 0
    public var maxFrame: Int32 = 131072
    public var heartbeat: Int32 = 0
    
    public var saslMetod: SRMQSaslMetod = .plain
    
    public init(
        vhost: String = "/",
        login: String = "",
        password: String = "",
        maxChannel: Int32 = 0,
        maxFrame: Int32 = 131072,
        heartbeat: Int32 = 0,
        saslMetod: SRMQSaslMetod = .plain
    ){
        self.vhost = vhost
        self.login = login
        self.password = password
        self.maxChannel = maxChannel
        self.maxFrame = maxFrame
        self.heartbeat = heartbeat
        self.saslMetod = saslMetod
    }
}
