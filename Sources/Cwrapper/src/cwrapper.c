//
//  clib.c
//  
//
//  Created by Александр Сенин on 16.02.2022.
//

#include "cwrapper.h"
#include <stdio.h>

long testFunc(int v){
    return v * v;
}
amqp_rpc_reply_t srmq_amqp_login(amqp_connection_state_t state,
                                 char const *vhost, int channel_max,
                                 int frame_max, int heartbeat,
                                 amqp_sasl_method_enum sasl_method,
                                 char const *login, char const *pass){
    amqp_login(state, vhost, channel_max, frame_max, heartbeat, sasl_method, login, pass);
}
