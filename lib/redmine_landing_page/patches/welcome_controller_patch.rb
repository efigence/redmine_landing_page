module RedmineLandingPage
  module Patches
    module WelcomeControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          def index_with_landing_page
            if show_landing_page?
              redirect_to User.current.landing_page, :status => 302
            else
              index_without_landing_page
            end
          end

          alias_method_chain :index, :landing_page

          private

          def show_landing_page?
            User.current.logged? && proper_referer? && proper_landing_page?
          end

          def proper_referer?
            if request.env['HTTP_REFERER'] == "#{request.scheme}://#{request.host_with_port}/login"
              true
            elsif Regexp.new(request.host_with_port) =~ request.env['HTTP_REFERER']
              false
            else
              true
            end
          end

          def proper_landing_page?
            !User.current.landing_page.blank? && User.current.landing_page != "/"
          end
        end
      end
    end
  end
end
