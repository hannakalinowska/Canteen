require File.join(File.dirname(__FILE__), '..', 'canteen.rb')

require 'rubygems'
require 'sinatra'
require 'rack/test'
require 'rspec'
require 'timecop'
require 'fakeweb'

# set test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
