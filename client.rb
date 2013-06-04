##
## client.rb
## Login : <lta@still>
## Started on  Tue May 28 15:14:43 2013 Lta Akr
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
Bundler.require(:default)
require './api_client'


get '/' do
  @texes = TexClient.texes['response']
  haml :index
end

get '/hashtags' do
  @hashtags = TexClient.hashtags['response']
  haml :hashtags
end

get '/hashtag/:hashtag' do |ht|
  @texes = TexClient.hashtag(ht)['response']
  haml :index
end

post '/tex' do
  puts params[:message]
  TexClient.tex!(params[:message])
  redirect '/'
end

