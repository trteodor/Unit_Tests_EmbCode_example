Hello, here i'am learning how use Unity and Cmock framework for unit test in embedded systems:
http://www.throwtheswitch.org/unity


* git clone --recursive https://github.com/trteodor/EmbeddedSystemsUnitTestExampleOnSTM32F103RB
* cd EmbeddedSystemsUnitTestExampleOnSTM32F103RB/third_party/cmock
* bundle install # Ensures you have all RubyGems needed


*Note:
third_party/cmock/scripts/create_mock.rb 

i modified line 5 to:

mock_out = ENV.fetch('MOCK_OUT', '../build/mocks')

so i will have to copy this file and use my own in project
