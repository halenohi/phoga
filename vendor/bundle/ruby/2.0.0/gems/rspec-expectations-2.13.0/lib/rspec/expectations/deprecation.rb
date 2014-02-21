module RSpec
  unless respond_to?(:deprecate)
    class << self
      # Used internally by RSpec to display standard deprecation warnings.
      # This is also defined in rspec-core, but we can't assume it's loaded
      # since rspec-expectations should be usable w/o rspec-core.
      def deprecate(method, alternate_method=nil, version=nil)
        version_string = version ? "rspec-#{version}" : "a future version of RSpec"

        message = <<-NOTICE

*****************************************************************
DEPRECATION WARNING: you are using deprecated behaviour that will
be removed from #{version_string}.

#{caller(0)[2]}

* #{method} is deprecated.
NOTICE
      if alternate_method
        message << <<-ADDITIONAL
* please use #{alternate_method} instead.
ADDITIONAL
      end

        message << "*****************************************************************"
        warn_deprecation(message)
      end

      # Used internally by RSpec to display custom deprecation warnings.  This
      # is also defined in rspec-core, but we can't assume it's loaded since
      # rspec-expectations should be usable w/o rspec-core.
      def warn_deprecation(message)
        warn(message)
      end
    end
  end
end
