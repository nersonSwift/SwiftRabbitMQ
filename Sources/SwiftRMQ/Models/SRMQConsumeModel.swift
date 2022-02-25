//
//  File.swift
//  
//
//  Created by Александр Сенин on 25.02.2022.
//

import Foundation

public struct SRMQConsumeModel{
    public var channel: UInt16
    public var routingKey: String
    public var exchange: String = ""
    
    public var passive: Bool = false
    public var durable: Bool = false
    public var exclusive: Bool = false
    public var autoDelete: Bool = false
    public var noLocale: Bool = false
    
    public init(
        channel: UInt16,
        routingKey: String,
        exchange: String = "",
        passive: Bool = false,
        durable: Bool = false,
        exclusive: Bool = false,
        autoDelete: Bool = false,
        noLocale: Bool = false
    ){
        self.channel = channel
        self.routingKey = routingKey
        self.exchange = exchange
        self.passive = passive
        self.durable = durable
        self.exclusive = exclusive
        self.autoDelete = autoDelete
        self.noLocale = noLocale
    }
}
