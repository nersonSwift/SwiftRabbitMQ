//
//  Header.h
//  
//
//  Created by Александр Сенин on 16.02.2022.
//

#ifndef clib_h
#define clib_h
#include <stdio.h>

#ifdef __APPLE__
    #include "/usr/local/include/amqp.h"
#else
    #include "amqp.h"
#endif

amqp_rpc_reply_t srmq_amqp_login(amqp_connection_state_t state,
                                 char const *vhost, int channel_max,
                                 int frame_max, int heartbeat,
                                 amqp_sasl_method_enum sasl_method,
                                 char const *login, char const *pass);

#endif /* clib_h */
