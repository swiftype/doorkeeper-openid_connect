module Doorkeeper
  module OpenidConnect
    class AccessGrant
      def self.prepended(base)
        base.class_eval do
          has_one :openid_request,
            :class_name => 'Doorkeeper::OpenidConnect::Request',
            :inverse_of =>:access_grant,
            :dependent => :delete
        end
      end
    end
  end

  AccessGrant.send :prepend, OpenidConnect::AccessGrant
end
