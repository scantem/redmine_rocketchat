require 'redmine'

require_dependency 'redmine_rocketchat/listener'

Redmine::Plugin.register :redmine_rocketchat do
	name 'Redmine Rocket.chat'
	author 'Simon Cantem'
	url 'https://github.com/scantem/redmine_rocketchat'
	description 'Rocket.chat chat integration'
	version '0.6.1'

	requires_redmine :version_or_higher => '2.0.0'

	settings \
		:default => {
			'callback_url' => 'http://example.com/callback/',
			'channel' => nil,
			'icon' => 'https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/icon.png',
			'username' => 'redmine',
			'display_watchers' => 'no',
			'auto_mentions' => 'yes',
			'new_include_description' => 'yes',
			'updated_include_description' => 'yes'
		},
		:partial => 'settings/rocketchat_settings'
end

ActionDispatch::Callbacks.to_prepare do
	require_dependency 'issue'
	unless Issue.included_modules.include? RedmineRocketchat::IssuePatch
		Issue.send(:include, RedmineRocketchat::IssuePatch)
	end
end
