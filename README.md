# rygel cookbook

This cookbook installs and configures rygel server.

# Requirements
an open mind

# Usage
Setup the required attributes and keep the "rygel::node" recipe in the
run list.

# Attributes
The following are the attributes (that may be) used by this cookbook.

* `node['rygel']['audio_directories']` - Audio directories
* `node['rygel']['video_directories']` - Video directories
* `node['rygel']['picture_directories']` - Picture directories
* `node['rygel']['db_dir']` - The database directory for rygel
* `node['rygel']['log_dir']` - The log directory for rygel
* `node['rygel']['log_level']` - The log level
* `node['rygel']['port']` - The port to listen on
* `node['rygel']['friendly_name']` - The friendly name to show to the clients
* `node['rygel']['ionotify']` - Whether to use enable/disable ionotify. Valid values: 'yes' and 'no'
* `node['rygel']['strict_dlna']` - Whether to enable strict dlna. Valid values: 'yes' and'no'
* `node['rygel']['enable_tivo']` - Whether to enable tivo mode. Valid values: 'yes' and'no'
* `node['rygel']['notify_interval']` - The ionotify interval to be used if ionotify is enabled

# Recipes

## rygel::default
This recipe installs the rygel package and configures based on the
minidlna attributes because I'm totally lazy and minidlna doesn't seem 
to be available in the standard Fedora 26 dnf repository.

I read this:
https://mail.gnome.org/archives/rygel-list/2014-March/msg00002.html

# Author

Author:: Tim Lum

* shamelessly based off the minidlna cookbook
https://supermarket.chef.io/cookbooks/minidlna


