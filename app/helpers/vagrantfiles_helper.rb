module VagrantfilesHelper
  def format_time time
    return "" if time == nil
    return time.strftime("%A %d, %Y at %H:%M")
  end
end
