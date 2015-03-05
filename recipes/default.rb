#
# Cookbook Name:: mj-base
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

# afio 用に multiverseのリポジトリを用意
# distribution　の version を確認する
#
distri = "trusty"
if node['platform_version'] == "12.04" then
  distri = "precise"
end

apt_repository 'multiverse' do
  uri          'http://jp.archive.ubuntu.com/ubuntu'
  distribution distri
  components   ['multiverse']
  deb_src      true
  action :add
end

# commonアプリケーションのインストール
node['mj-base']['common_applications'].each do |pkg|
    package pkg do
        action :install
    end
end

# optionアプリケーションのインストール
node['mj-base']['option_applications'].each do |pkg|
    package pkg do
        action :install
    end
end

# motd の設定
cookbook_file "/etc/update-motd.d/00-header" do
    source "motd/00-header.erb"
    owner "root"
    group "root"
    mode "0755"
end

include_recipe "locale::default"

# set env vars
ENV["LANG"] = node["locale"]["lang"]
ENV["LC_ALL"] = node["locale"]["lang"]