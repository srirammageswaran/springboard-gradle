#
# Original Author: Michael Klishin (<michael@defprotocol.org>)
# Author: Denis Karpenko (<denis@karpenko.me>)
# Cookbook Name: gradle
# Recipe: tarball
#
# Copyright 2012, Michael S. Klishin.
# Copyright 2012, Denis Karpenko.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
log "Installing Gradle"
log "#{node['java']['accept_license_agreement']}"
include_recipe "java::default"
ark "gradle" do 
  path "/opt/"
  action :install 
  version "2.0"
  url "http://cloudcto.wipro.com/dockerchef/gradle-2.0-bin.zip"
  owner "root"
  mode 0766
  append_env_path true
end
