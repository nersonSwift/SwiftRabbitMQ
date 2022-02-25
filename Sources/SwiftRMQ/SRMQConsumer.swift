//
//  SRMQConsumer.swift
//  SwiftRMQ
//
//  Created by Александр Сенин on 23.02.2022.
//

import Foundation
import Campq

public class SRMQConsumer: SRMQService{
    @discardableResult
    public func consume(model: SRMQConsumeModel, handler: @escaping (String) -> ()) -> Self{
        let isExchange = model.exchange != ""
        
        let qname = queueDeclare(isExchange: isExchange, model: model)
        queueBind(isExchange: isExchange, model: model, qname: qname)
        basicConsume(model: model, qname: qname)
        startTask(model: model, handler: handler)
        return self
    }
    
    private func queueDeclare(isExchange: Bool, model: SRMQConsumeModel) -> amqp_bytes_t{
        let value = amqp_queue_declare(
            connect,
            model.channel,
            isExchange ? amqp_empty_bytes : amqp_cstring_bytes(model.routingKey),
            model.passive ? 1 : 0,
            model.durable ? 1 : 0,
            model.exclusive ? 1 : 0,
            model.autoDelete ? 1 : 0,
            amqp_empty_table
        )
        return amqp_bytes_malloc_dup(value?.pointee.queue ?? amqp_empty_bytes)
    }
    
    private func queueBind(isExchange: Bool, model: SRMQConsumeModel, qname: amqp_bytes_t){
        if isExchange{
            amqp_queue_bind(
                connect,
                model.channel,
                qname,
                amqp_cstring_bytes(model.exchange),
                amqp_cstring_bytes(model.routingKey),
                amqp_empty_table
            )
        }
    }
    
    private func basicConsume(model: SRMQConsumeModel, qname: amqp_bytes_t){
        amqp_basic_consume(
            connect,
            model.channel,
            qname,
            amqp_empty_bytes,
            model.noLocale ? 1 : 0,
            1,
            model.exclusive ? 1 : 0,
            amqp_empty_table
        )
    }
    
    private func startTask(model: SRMQConsumeModel, handler: @escaping (String) -> ()){
        Task{[weak self] in
            guard let self = self else {return}
            var frame = amqp_frame_t()
            while true{
                amqp_maybe_release_buffers(self.connect)
                var envelope = amqp_envelope_t()
                amqp_simple_wait_frame(self.connect, &frame)
            
                amqp_consume_message(self.connect, &envelope, nil, 0)
                
                var message = amqp_message_t()
                amqp_read_message(self.connect, model.channel, &message, 0)
                if let bytes = message.body.bytes{
                    let data = Data(bytes: bytes, count: message.body.len)
                    handler(String(data: data, encoding: .utf8) ?? "")
                }
                amqp_destroy_message(&message)
                amqp_destroy_envelope(&envelope)
            }
        }
    }
}
