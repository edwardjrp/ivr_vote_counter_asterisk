require 'active_record'
require 'fileutils'
require 'ruby-agi'
require 'savon'
require 'adhearsion'
require 'adhearsion/voip/asterisk/manager_interface'

class Ivr
  $log = Logger.new('tmp/log.txt','weekly')
  $log.level = Logger::DEBUG

  WSDLFILE = "config/wsOpIVR.xml"

  #This method is fired when the class is instatiated
  def initialize

  end

  def isDID(did,seccode)

    Savon.configure do |config|
      config.soap_version = 2  # use SOAP 1.2      
    end
    
    client = Savon::Client.new(WSDLFILE)
    begin
      #client.wsdl.document = File.expand_path("../config/wsOpIVR.xml", __FILE__)
      client.wsdl.namespace = "http://tempuri.org/"
      client.wsdl.endpoint = "http://tempuri.org/wMod_DidCHeck"
      
      #puts client.wsdl.soap_actions
      #Methods available
      #hello_world,w_mod_did_c_heck,w_mod_check_recinto_colegio,w_mod1_process_voter,w_mod3_process_colegio
      response = client.request "wMod_DidCHeck" do |soap|
        #client.http.headers["SOAPAction"] = '"http://tempuri.org/wMod_DidCHeck"'
        soap.body do |input|
          input.vDID(did)
          input.SecCode(seccode)
        end
        #client.xmlns = "http://tempuri.org/"
=begin        
        soap.body = {
            :vDID => did,
            :SecCode => seccode
        }
=end        
        #@callback = soap.body
      end

      #@callback = response.to_hash
      #response.pretty_print_inspect
      #response.body
      #if response.success
      #return response.body[:w_mod_did_c_heck_response][:w_mod_did_c_heck_result]
      puts response.body

    rescue Exception => e
      $log.debug e
    end


  end


  def method2

  end
end

