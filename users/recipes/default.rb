#
# Cookbook Name:: users
# Recipe:: default
#
#

user node[:user][:name] do
	supports :manage_home => true
	uid 3828
	home "/home/#{node[:user][:name]}"
	action :create
end

directory "/home/#{node[:user][:name]}/.ssh" do
	owner node[:user][:name]
	action :create
end

template "/home/#{node[:user][:name]}/.ssh/authorized_keys" do
	source "authorized_keys.erb"
	owner node[:user][:name]
	mode "0600"
	action :create
end
