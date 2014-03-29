require 'socket'

Rails.application.config.middleware.use OmniAuth::Builder do

	puts '**********************************'
	puts Socket.gethostname

	if Socket.gethostname.match('harvard.edu')
	  provider :twitter, 'JiT6PjAl4MTXCSvRm4aFA', '7URkC9GBIU39CbJMkaFnQilq8qA0H4fAFYITFtYkQv4', :display => "popup"
	  provider :facebook, '1471364669746168', 'daf410d3bcf59696b32aa36bbc3ca504', :display => "popup"
	  provider :linkedin, '77n7xe5k86jqwd', '1kdbgL99EJ0pvmtt'
		puts 'local host'
	else
      puts 'staging'
	  provider :facebook, '552978684817030', '9d80da4846a2791a79df262cb25a9fa9', :display => "popup"

	end 

end