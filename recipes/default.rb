#
# Cookbook Name:: rygel
# Recipe:: default
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

# Install the rygel package
package 'rygel'
package 'tumbler'
package 'gupnp'

template '/usr/lib/systemd/system/rygel.service' do
  source 'rygel.service.erb'
end

template node['rygel']['config_file'] do
  source 'rygel.conf.erb'
  variables(
    node['rygel']['conf']
  )
  notifies :reload, 'service[rygel]', :delayed
end

# Enable and start the rygel service
service 'rygel' do
  action [:enable, :start]
end

