#
# Cookbook Name:: rygel
#
# Copyright (C) 2017 Tim Lum
# 
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# 

# Audio directories
default['rygel']['audio_directories'] = '@MUSIC@'

# Video directories
default['rygel']['video_directories'] = '@VIDEOS@'

# Picture directories
default['rygel']['picture_directories'] = '@PICTURES@'

# The log directory for rygel
default['rygel']['log_dir'] = '/var/log'

# The log level
# Comma-separated list of domain:level pairs to specify log level thresholds for
# individual domains. domain could be either 'rygel', name of a plugin or '*'
# for all domains. Allowed levels are:
#
# 1=critical
# 2=error
# 3=warning
# 4=message/info
# 5=debug
default['rygel']['log_level'] = '*:4'

# The port to run HTTP server on. 0 means dynamic. 
default['rygel']['port'] = 0

# The friendly name to show to the clients 
default['rygel']['friendly_name'] = '@REALNAME@\'s media on @PRETTY_HOSTNAME@'

default['rygel']['user'] =  'rygel'
default['rygel']['group'] = 'rygel'
default['rygel']['config_file'] = "#{node['etc']['passwd'][node['rygel']['user']]['dir']}/.config/rygel.conf"

default['rygel']['conf'] = {
  'video_upload_folder' =>      node['rygel']['video_directories'],
  'music_upload_folder' =>      node['rygel']['audio_directories'],
  'picture_upload_folder' =>    node['rygel']['picture_directories'],
  'port' =>                     node['rygel']['port'].to_s, 
  'log_level' =>                node['rygel']['log_level'],
  'only_export_from' => [
    node['rygel']['audio_directories'],
    node['rygel']['video_directories'],
    node['rygel']['picture_directories'] ].join(';'),
  'tracker_title' =>            node['rygel']['friendly_name'],
  'lms_title' =>                node['rygel']['friendly_name'],
  'export_title' =>             node['rygel']['friendly_name'],
  'uris' => [
    node['rygel']['audio_directories'],
    node['rygel']['video_directories'],
    node['rygel']['picture_directories'] ].join(';')
}

