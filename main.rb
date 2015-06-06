#!/Users/EdwardData/.rvm/rubies/ruby-1.9.2-p290/bin/ruby
require 'rubygems'
require 'active_record'
require 'yaml'
require 'fileutils'
#require 'action_mailer'
require 'logger'
require 'mail'
require File.expand_path('../ivr.rb', __FILE__)
require 'ruby-agi'
require 'savon'

# Logging info
$log = Logger.new('tmp/log.txt','weekly')
$log.level = Logger::DEBUG
$log.info ".....................App Started - Ready to interact with Asterisk....................."


ivr = Ivr.new


ARGV.each do|did|
  puts "DID sent: #{did}"
  #result = ivr.isDID(did,"")
  #puts "PersonID: " + result[:person_id]
  #puts "RecintoID: "+result[:recinto_id]
  #puts "Msg: "+result[:error_message]  
  #puts "Ok?: "+result[:is_ok].to_s  
  
end

agi = AGI.new

$log.info "#{agi.callerid}"


$log.info ".....................Application finished execution....................."
