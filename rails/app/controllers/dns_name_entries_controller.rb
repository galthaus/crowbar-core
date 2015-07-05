# Copyright 2015, Greg Althaus
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#  http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

class DnsNameEntriesController < ::ApplicationController
  respond_to :html, :json

  def show
    @entry = DnsNameEntry.find_key params[:id]
    respond_to do |format|
      format.html { }
      format.json { render api_show @entry }
    end
  end

  def index
    @entries = DnsNameEntry.all.includes(network_allocation: [:node]).includes(:dns_name_filter)
    respond_to do |format|
      format.html {}
      format.json { render api_index DnsNameEntry, @entries }
    end
  end

end
