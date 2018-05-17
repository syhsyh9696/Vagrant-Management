xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Experiments"
    xml.description "VManagement Experiments"
    xml.link "http://www.vmanagement.com"

    @experiments.each do |experiment|
      xml.item do
        xml.title experiment.title
        xml.description experiment.content
        xml.pubDate experiment.created_at.to_s(:rfc822)
        xml.link experiment_url(experiment)
        xml.guid experiment_url(experiment)
      end
    end
  end
end