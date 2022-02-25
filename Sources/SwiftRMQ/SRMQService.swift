//
//  File.swift
//
//
//  Created by Александр Сенин on 23.02.2022.
//

import Foundation
import Campq
import Cwrapper

public class SRMQService{
    var connectModel: SRMQConnectModel?
    var loginModel: SRMQLoginModel?
    
    var connect: amqp_connection_state_t?
    
    @discardableResult
    public func connect(model: SRMQConnectModel) -> Self{
        connectModel = model
        connect = amqp_new_connection()
        let socket = amqp_tcp_socket_new(connect)
        amqp_socket_open(socket, model.host, model.port)
        return self
    }
    
    @discardableResult
    public func login(model: SRMQLoginModel) -> Self{
        loginModel = model
        srmq_amqp_login(
            connect,
            model.vhost,
            model.maxChannel,
            model.maxFrame,
            model.heartbeat,
            AMQP_SASL_METHOD_PLAIN,
            model.login,
            model.password
        )
        return self
    }
    
    @discardableResult
    public func open(channel: UInt16) -> Self{
        amqp_channel_open(connect, channel)
        return self
    }
    
    public init(){}
}
