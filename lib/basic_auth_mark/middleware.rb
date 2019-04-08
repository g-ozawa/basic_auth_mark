module BasicAuthMark
  class Middleware
    include Rack::Utils

    def initialize(app)
      @app = app
    end

    def call(env)
      status, headers, response = @app.call(env)

      return [status, headers, response] unless headers['Content-Type'].to_s =~ %r{\btext/html\b}i
      return [status, headers, response] if status >= 300 && status < 400

      markable_ip_addresses = BasicAuthMark.markable_ip_addresses

      request = Rack::Request.new(env)

      if markable_ip_addresses.empty? || markable_ip_addresses.include?(request.ip)
        basic_request = Rack::Auth::Basic::Request.new(env)

        if basic_request.provided? && basic_request.basic?
          new_body = ''
          response.each do |b|
            begin
              new_body << insert_basic_auth_marks(b)
            rescue => exception
              $stderr.write %Q|Failed to insert basic auth marks: #{exception.message}\n  #{exception.backtrace.join("  \n")}|
            end
          end
          response.close if response.respond_to?(:close)
          headers['Content-Length'] &&= new_body.bytesize.to_s
          response = [new_body]
        end
      end

      [status, headers, response]
    end

    private

    def insert_basic_auth_marks(body)
      mark = BasicAuthMark::Mark.new
      body = mark.insert_into(body)
      body
    end
  end
end
