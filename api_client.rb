##
## api_client.rb
## Login : <lta@still>
## Started on  Tue May 28 15:20:08 2013 Lta Akr
## $Id$
##
## Author(s):
##  - Lta Akr <>
##
## Copyright (C) 2013 Lta Akr
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
##

require 'rubygems'
require 'bundler/setup'
require 'json'
require 'rest_client'


class TexClient
  URL = 'http://localhost/1'.freeze

  class << self
    def url(method)
      "#{TexClient::URL}/#{method}"
    end

    def _wrap
      begin
        yield
      rescue
        puts "We've got an error: #{$!}"
        puts "Here's the backtrace bro:\n#{$!.backtrace.join("\n")}"
        {}
      end
    end

    def get(method, params={})
      _wrap { JSON.parse(RestClient.get(url(method), params)) }
    end

    def post(method, params={})
      _wrap { JSON.parse(RestClient.post(url(method), params)) }
    end

    def texes(page=1)
      get(:tex, page: page)
    end

    def tex!(message)
      post(:tex, tex:{message: message})
    end

    def hashtags(page=1)
      get(:hash_tags, page: page)
    end
    def hashtag(id)
      get("hash_tags/#{id}")
    end
  end
end
