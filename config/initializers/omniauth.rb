Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'JiT6PjAl4MTXCSvRm4aFA', '7URkC9GBIU39CbJMkaFnQilq8qA0H4fAFYITFtYkQv4', :display => "popup"
  provider :facebook, '1471364669746168', 'daf410d3bcf59696b32aa36bbc3ca504', :display => "popup"
  provider :linkedin, '77n7xe5k86jqwd', '1kdbgL99EJ0pvmtt'
end