require "bundler/setup"
require "bravo/version"
require "bravo/constants"
require "savon"
require "bravo/core_ext/float"
require "bravo/core_ext/hash"
require "bravo/core_ext/string"

require 'net/http'
require 'net/https'
             
module Bravo

  class NullOrInvalidAttribute < StandardError; end

  autoload :Authorizer,   "bravo/authorizer"
  autoload :AuthData,     "bravo/auth_data"
  autoload :Bill,         "bravo/bill"
  autoload :Constants,    "bravo/constants"
  autoload :Wsaa,         "bravo/wsaa"
  autoload :ComprobanteConstatar, "bravo/comprobante_constatar"


  extend self
  attr_accessor :cuit, :sale_point, :service_url, :default_documento, :pkey, :cert,
    :default_concepto, :default_moneda, :own_iva_cond, :verbose, :auth_url, :openssl_bin

  def auth_hash
    {"Token" => Bravo::TOKEN, "Sign"  => Bravo::SIGN, "Cuit"  => Bravo.cuit}
  end

  def log?
    Bravo.verbose || ENV["VERBOSE"]
  end
  
  def deleteToken
      AuthData.deleteToken
  end
        

end
