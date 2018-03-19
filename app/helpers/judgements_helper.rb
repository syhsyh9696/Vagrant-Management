module JudgementsHelper
  def option_tags
    @systems = Operatingsystem.all; result = []
    @systems.each do |sys|
      result << ["#{sys.system_name} #{sys.system_version}", sys.id]
    end
    result
  end

  def selected_option file
    return file.operatingsystem.id if file.operatingsystem != nil
    return 0
  end

end
