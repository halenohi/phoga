module Phoga::ApplicationHelper
  def active_class(path_or_paths, options = {})
    result = false
    (path_or_paths.is_a?(Array) ? path_or_paths : [path_or_paths]).each do |path|
      pattern = options[:lefthand_match] && path != root_path ? "^#{ path }" : "^#{ path }$"
      result = request.path.match(Regexp.new(pattern))
      break if result
    end
    result ? ' active ' : ''
  end
end
