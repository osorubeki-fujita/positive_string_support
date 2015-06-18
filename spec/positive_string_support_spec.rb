require 'spec_helper'
require 'deplo'

spec_filename = ::File.expand_path( ::File.dirname( __FILE__ ) )

describe PositiveStringSupport do
  it "has a version number \'#{ ::PositiveStringSupport::VERSION }\'" do
    # expect( PositiveStringSupport::VERSION ).to eq( version )
    expect( ::Deplo.version_check( PositiveStringSupport::VERSION , spec_filename ) ).to eq( true )
  end
end


require_relative 'positive_string_support_spec/string_ext.rb'
