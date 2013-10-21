module RedmineLandingPage
  module Patches
    module WelcomeControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          def index_with_landing_page
            if User.current.logged? && User.current.landing_page &&
               !User.current.landing_page.empty? && get_landing_page? &&
               User.current.landing_page != "/"
              redirect_to User.current.landing_page, :status => 302
            else
              index_without_landing_page
            end
          end

          alias_method_chain :index, :landing_page

          private
            def get_landing_page?
              reg_exp = Regexp.new request.host_with_port
              if request.env['HTTP_REFERER'] == "#{request.scheme}://#{request.host_with_port}/login"
                true
              elsif reg_exp =~ request.env['HTTP_REFERER']
                false
              else
                true
              end
            end
        end
      end
    end
  end
end
