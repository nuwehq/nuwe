require './lib/nuwe'
require 'minitest/autorun'
require 'webmock/minitest'
require 'vcr'

Nuwe.configure do |c|
  c.token = "8f399c4c-8bbf-4272-938e-f3e4123d194f"
  c.endpoint = "http://nuapi.dev"
end

VCR.configure do |c|
  c.cassette_library_dir = 'test/fixtures'
  c.hook_into :webmock
end
