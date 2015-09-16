class ActiveSupport::TimeWithZone


  def as_json(options = nil)
    %(#{time.strftime("%Y-%m-%dT%H:%M:%SZ")})
  end

end
