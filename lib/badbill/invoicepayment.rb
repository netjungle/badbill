# encoding: utf-8

class BadBill
  # The clients resource handles all clients.
  #
  # See http://www.billomat.com/en/api/clients/
  class Invoicepayment < BaseResource
    
    
    def self.resource_name
      "invoice-payments"
    end
    
  end
end