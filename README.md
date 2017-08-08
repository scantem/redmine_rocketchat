*This is no longer maintained. I've 1) moved to Mattermost due to connectivity problems with Rocket.chat and 2) I'm now using: http://github.com/alphanodes/redmine_messenger which works with both Rocket.chat & Mattermost (& Slack)*

# Rocket.chat chat plugin for Redmine

This plugin posts updates to issues in your Redmine installation to a Rocket.chat
channel.

Redmine Supported versions: 2.0.x - 3.3.x.

Rocket.chat Supported versions: 0.53.0

## Screenshot

![screenshot](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/screenshot.png)

## Installation

From your Redmine plugins directory, clone this repository as `redmine_rocketchat` (note
the underscore!):

    git clone https://github.com/scantem/redmine_rocketchat.git redmine_rocketchat

You will also need the `httpclient` dependency, which can be installed by running

    bundle install

from the plugin directory.

Restart Redmine, and you should see the plugin show up in the Plugins page.
Under the configuration options, set the Rocket.chat API URL to the URL for an
Incoming WebHook integration in your Rocket.chat account (see also the next two sections).

## Customized Routing

You can also route messages to different channels on a per-project basis. To
do this, create 2 project custom fields (Administration > Custom fields > Project)
named `Rocketchat Channel`and Rocketchat URL. If no custom channel is defined for a project, the parent
project will be checked (or the default will be used). To prevent all notifications
from being sent for a project, set the custom channel to `-`.

Actually with version 0.53.0 of Rocket.chat, only the Rocketchat URL is used.  The channel is
defined in the webhook setup for that URL.  The `Rocketchat Channel` configuration is left
in the instructions below for reference to past versions of Rocket.chat that may have used
this parameter.

For more information, see http://www.redmine.org/projects/redmine/wiki/Plugins (see also next section for an easy configuration demonstration). 

## Screenshot Guided Configuration

Step 1: Create an Incoming Webhook in Rocket.chat (Administration > Integrations > NEW INTEGRATION > Incoming Webhook).

![step1a](https://cloud.githubusercontent.com/assets/2335362/23932036/4dc6e81c-0968-11e7-8ac9-1decbfad2b9b.png)

Note the URL of the webhook once it has been created:

![step1b](https://cloud.githubusercontent.com/assets/2335362/23932037/4dc6e894-0968-11e7-9ba6-ac2119383364.png)

Step 2: Install this Redmine plugin for Rocket.chat.

![step2](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/step2.png)

Step 3: Configure this Redmine plugin for Rocket.chat. For per-project customized routing, leave the `Rocket.chat URL` and `Rocket.chat Channel` fields empty and follow the next steps, otherwise all Redmine projects will post to the same Rocket.chat channel. Be careful when filling the channel field, you need to input the channel's handle, not the display name visible to users. You can find each channel's handle by going inside the channel and click the down-arrow and selecting view info.

![step3](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/step3.png)

Step 4: For per-project customized routing, first create the project custom field (Administration > Custom fields > Project).

![step4a](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/step4a.png)
![step4b](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/step4b.png)

These fields need to be called `Rocketchat URL` and `Rocketchat Channel`.

Step 5: For per-project customized routing, configure the Rocketchat URL and Rocketchat Channel handles inside your Redmine project.

![step5](https://raw.githubusercontent.com/scantem/redmine_rocketchat/assets/step5.png)

## Credits

The source code is forked from https://github.com/altsol/redmine_mattermost with minor adjustments for Rocket.chat, the redmine_mattermost project was forked from https://github.com/sciyoshi/redmine-slack. Special thanks to the original author and contributors for making this awesome hook for Redmine. This fork is just refactored to use Rocket.chat-namespaced configuration options in order to use multiple hooks (Rocket.chat, Mattermost and Slack) in a Redmine installation and make the announcements Rocket.chat friendly.
