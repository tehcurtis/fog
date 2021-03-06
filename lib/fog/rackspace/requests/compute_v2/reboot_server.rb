module Fog
  module Compute
    class RackspaceV2
      class Real
        def reboot_server(server_id, type)
          data = {
            'reboot' => {
              'type' => type
            }
          }

          request(
            :body => Fog::JSON.encode(data),
            :expects => [202],
            :method => 'POST',
            :path => "servers/#{server_id}/action"
          )
        end
      end

      class Mock
        def reboot_server(server_id, type)
          body = {
            "reboot" => {
              "type" => type.upcase
            }
          }
          response(
            :body => body,
            :status => 202
          )
        end
      end
    end
  end
end
