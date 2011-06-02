Bsonrpc
=======

This is an experimental RPC client, which uses BSON as data serialization, and sends/receives data directly 
via an TCPSocket. I'm experimenting with this to speed up [Kangaroo](https://github.com/cice/kangARoo), and
reduce XML/HTTP overhead. Personally i'm not a big fan of RPC at all, but OpenERP depends on it. If anyone
has got any other use for this, i'd be glad to help/continue development/bring it to stable version/implement
a corresponding server.