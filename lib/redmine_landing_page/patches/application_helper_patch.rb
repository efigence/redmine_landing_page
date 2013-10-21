module RedmineLandingPage
  module Patches
    module ApplicationHelperPatch
      def landing_page_select_opts
        opts = {}
        Setting.plugin_redmine_landing_page[:pages].each do |k,v|
          opts[v[:name]] = v[:path]
        end
        opts["Administration"] = "/admin" if User.current.admin?
        opts
      end
    end
  end
end
