//
//  File.swift
//
//
//  Created by Александр Сенин on 23.02.2022.
//

import Foundation
import Campq

public class SRMQProducer: SRMQService{
    @discardableResult
    public func send(model: SRMQSendModel) -> Self{
        let data = model.massage.data(using: .utf8) ?? Data()
        let cString = [UInt8](data)
        
        let pointer = UnsafeMutablePointer<UInt8>.allocate(capacity: cString.count)
        pointer.initialize(from: cString, count: cString.count)
        
        amqp_basic_publish(
            connect,
            model.channel,
            amqp_cstring_bytes(model.exchange),
            amqp_cstring_bytes(model.routingKey),
            model.mandatory ? 1 : 0,
            model.immediate ? 1 : 0,
            nil,
            amqp_bytes_t(
                len: data.count,
                bytes: pointer
            )
        )
        
        pointer.deinitialize(count: cString.count)
        pointer.deallocate()
        return self
    }
}
