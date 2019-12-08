#
# Cookbook:: workstation
# Recipe:: setup
#
# Copyright:: 2019, The Authors, All Rights Reserved.
# frozen_string_literal: true

package 'vim-enhanced' do
  action :install
end
package 'nano'
package 'emacs'
package 'tree' do
  action :install
end

package 'ntp'

package 'git' do
  action :install
end

template '/etc/motd' do
  source 'motd.erb'
  variables(
    name: 'Balkar'
  )
  action :create
end

service 'ntpd' do
  action [:enable, :start]
end

user 'user1' do
  comment 'user1'
  uid '123'
  home '/home/user1'
  shell '/bin/bash'
end

group 'admins' do
  members 'user1'
end

