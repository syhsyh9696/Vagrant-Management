module ApplicationHelper
  def format_time time
    return time.strftime("%A %d, %b, %Y at %H:%M")
  end
end
