module RedmineLandingPage
  module Patches
    module WelcomeControllerPatch
      def self.included(base)
        base.class_eval do
          unloadable

          def index_with_landing_page
            if show_landing_page?
              redirect_to landing_page_url, :status => 302
            else
              index_without_landing_page
            end
          end

          alias_method_chain :index, :landing_page

          private

          def show_landing_page?
            User.current.logged? && referer_check && applicable_landing_page?
          end

          def referer_check
            request.referer.nil? || request.referer =~ Regexp.new(signin_url)
          end

          def applicable_landing_page?
            !User.current.landing_page.blank? && User.current.landing_page != "/"
          end

          def landing_page_url
            "#{home_url.chomp('/')}#{User.current.landing_page}"
          end
        end
      end
    end
  end
end
