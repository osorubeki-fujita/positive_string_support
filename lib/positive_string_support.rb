require "positive_string_support/version"

require "active_support"
require "active_support/core_ext"
require "moji"

require_relative "positive_string_support/string_ext"
require_relative "positive_string_support/regexp_library"

module PositiveStringSupport

  extend ::ActiveSupport::Concern

  included do

    ::String.class_eval do
      include ::PositiveStringSupport::StringExt
    end

  end

end

include PositiveStringSupport
