//
//  File.swift
//  
//
//  Created by Александр Сенин on 25.02.2022.
//

import Foundation

public struct SRMQSendModel{
    public var massage: String
    public var channel: UInt16
    public var exchange: String = ""
    public var routingKey: String
    public var mandatory: Bool = false
    public var immediate: Bool = false
    
    public init(
        massage: String,
        channel: UInt16,
        exchange: String = "",
        routingKey: String,
        mandatory: Bool = false,
        immediate: Bool = false
    ){
        self.massage = massage
        self.channel = channel
        self.exchange = exchange
        self.routingKey = routingKey
        self.mandatory = mandatory
        self.immediate = immediate
    }
}
