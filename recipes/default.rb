#
# Cookbook Name:: haproxy-chef
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

apt_package "haproxy" do
  action :install
end

template "/etc/default/haproxy" do
  source "haproxy.erb"
  mode '0755'
  owner 'haproxy'
  group 'haproxy'
  notifies :reload, 'service[haproxy]', :immediately
end

template "/etc/haproxy/haproxy.cfg" do
  source "haproxy.cfg.erb"
  mode '0755'
  owner 'haproxy'
  group 'haproxy'
  notifies :reload, 'service[haproxy]', :immediately
end

service 'haproxy' do
  supports :restart => true, :reload => true
  action :nothing
end

