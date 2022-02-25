#ifndef ampq_shim_h
#define ampq_shim_h
#ifdef __APPLE__
    #include "/usr/local/include/amqp.h"
    #include "/usr/local/include/amqp_framing.h"
    #include "/usr/local/include/amqp_ssl_socket.h"
    #include "/usr/local/include/amqp_tcp_socket.h"
#else
    #include "amqp.h"
    #include "amqp_framing.h"
    #include "amqp_ssl_socket.h"
    #include "amqp_tcp_socket.h"
#endif
#endif
