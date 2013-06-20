module Phoga::ApplicationHelper
  def active_class?(path)
    request.path.match Regexp.new("^#{ path }") ? ' active ' : ''
  end
end
