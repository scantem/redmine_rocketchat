require 'redmine'

require_dependency 'redmine_rocketchat/listener'
require_dependency 'redmine_rocketchat/mail_handler_patch'

Redmine::Plugin.register :redmine_rocketchat do
	name 'Redmine Rocket.chat'
	author 'Simon Cantem'
	url 'https://github.com/scantem/redmine_rocketchat'
	description 'Rocket.chat chat integration'
	version '0.1'

	requires_redmine :version_or_higher => '2.0.0'

	settings \
		:default => {
			'callback_url' => 'http://example.com/callback/',
			'channel' => nil,
			'icon' => 'https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/icon.png',
			'username' => 'redmine',
			'display_watchers' => 'no'
		},
		:partial => 'settings/rocketchat_settings'
end
