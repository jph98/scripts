client.rb

    #!/usr/bin/env ruby
    
    require "socket"
    
    sock = UDPSocket.new()
    
    data = 'I sent this'
    
    sock.send(data, 0, '127.0.0.1', 33333)


server.rb

    #!/usr/bin/env ruby

    require "socket"
    
    BasicSocket.do_not_reverse_lookup = true
    
    # Create socket and bind to address
    client = UDPSocket.new()
    
    port = 33333
    
    client.bind('0.0.0.0', port)
    
    data, addr = client.recvfrom(1024) 
    
    puts "From addr: '%s', msg: '%s'" % [addr.join(','), data]
