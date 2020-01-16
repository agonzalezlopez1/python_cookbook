#
# Cookbook:: It_app
# Recipe:: default
#
# Copyright:: 2020, The Authors, All Rights Reserved.
apt_update "update" do
  action :update
end
package "python3-dev" do
  action :install
end

package "python3-pip"

directory '/home/ubuntu' do
  action :create
end

cookbook_file '/home/ubuntu/requirements.txt' do
  source 'files/requirements'
  action :create
end

execute "pip3 install requirements" do
  command "pip3 install /home/ubuntu/requirements.txt"
  action :run
end
directory '/home/vagrant/Downloads' do
  action :create
end
file '/home/vagrant/Downloads/ItJobsWatchTop30.csv' do
  action :create
  mode '777'
end
