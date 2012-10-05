# encoding: utf-8

class BadBill
  # The clients resource handles all clients.
  #
  # See http://www.billomat.com/en/api/clients/
  class InvoiceItem < BaseResource
    
    
    def self.resource_name_singular
      "invoiceitem"
    end
    
    def self.resource_name
      "invoice-items"
    end
    
  end
end