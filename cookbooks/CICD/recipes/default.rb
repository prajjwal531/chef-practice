#
# Cookbook:: cicd
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

package node["CICD"]["java-version"]  do
  action :install
end

remote_file '/etc/yum.repos.d/jenkins.repo' do
  source 'http://pkg.jenkins-ci.org/redhat/jenkins.repo'
  mode '0755'
  action :create
end

execute "adding jenkins keys" do
  command 'rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key'
end

package "jenkins" do
  action :install
end
