# encoding: utf-8

require_relative 'helper'

describe BadBill do
  it "creates new global connection object" do
    BadBill.connection.should be_nil
    b = BadBill.new "ruby", "12345"
    BadBill.connection.should_not be_nil
  end

  context "sending requests" do
    before :each do
      @badbill = BadBill.new "ruby", "12345"
    end

    it "sends a specified request to the API" do
      stub = stub_request(:get, "ruby.billomat.net/api/").
        with(:headers => {'Accept' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.call ''
      stub.should have_been_requested
    end

    it "sends a GET request to the API" do
      stub = stub_request(:get, "ruby.billomat.net/api/").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.get ''
      stub.should have_been_requested
    end

    it "sends a GET request with parameters to the API" do
      stub = stub_request(:get, "ruby.billomat.net/api/resource/?option=foobar").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.get 'resource', option: "foobar"
      stub.should have_been_requested
    end

    it "sends a POST request to the API" do
      stub = stub_request(:post, "ruby.billomat.net/api/").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/,
          'Content-Type' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.post ''
      stub.should have_been_requested
    end

    it "sends a PUT request to the API" do
      stub = stub_request(:put, "ruby.billomat.net/api/").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/,
          'Content-Type' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.put ''
      stub.should have_been_requested
    end

    it "sends a DELETE request to the API" do
      stub = stub_request(:delete, "ruby.billomat.net/api/").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/}).
        to_return(:body => "{}")

      @badbill.delete ''
      stub.should have_been_requested
    end

    it "returns an error object on HTTP errors" do
      stub = stub_request(:get, "ruby.billomat.net/api/resource/").
        with(:headers => {'X-BillomatApiKey' => '12345',
          'Accept' => /application\/json/}).
        to_return(:status => 404)

      resp = @badbill.get 'resource'
      resp.error.kind_of?(Faraday::Error::ClientError).should == true
      stub.should have_been_requested
    end
  end
end
