require 'redmine'

Redmine::Plugin.register :redmine_landing_page do
  name 'Redmine Landing Page plugin'
  author 'Jacek Grzybowski'
  description 'Plugin which adds the functionality of selecting landing page by users'
  version '0.0.1'
  url 'http://github.com/efigence/redmine_landing_page'
  author_url 'http://efigence.com'

  settings :default => {
    pages: {
      'page1' => { name: 'Home',     path: '/' },
      'page2' => { name: 'My Pages', path: '/my/page' },
      'page3' => { name: 'Projects', path: '/projects'}
    }
    }, :partial => 'settings/landing_pages'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'principal'
  User.send(:include, RedmineLandingPage::Patches::UserPatch)

  require_dependency 'welcome_controller'
  WelcomeController.send(:include, RedmineLandingPage::Patches::WelcomeControllerPatch)

  require_dependency 'application_helper'
  ActionView::Base.send(:include, RedmineLandingPage::Patches::ApplicationHelperPatch)
end

require 'redmine_landing_page/hooks/view_my_account_hook'
