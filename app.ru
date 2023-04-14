require 'rack-proxy'

class DebugProxy < Rack::Proxy
  BACK_END = URI(ENV['BACK_END'])

  def perform_request(env)
    # most backends required host set properly, but rack-proxy doesn't set this for you automatically
    # even when a backend host is passed in via the options
    env['HTTP_HOST'] = BACK_END.host
    env['HTTP_X_FORWARDED_HOST']  = BACK_END.host
    env['HTTP_X_FORWARDED_PROTO'] = BACK_END.scheme
    env['HTTP_X_FORWARDED_PORT'] = BACK_END.port.to_s

    # don't send your sites cookies to target service, unless it is a trusted internal service that can parse all your cookies
    # env['HTTP_COOKIE'] = ''

    super(env)
  end
end

run DebugProxy.new

