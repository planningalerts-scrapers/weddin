require 'scraperwiki'
require 'horizon_xml'

collector = Horizon_xml.new
collector.base_url    = 'http://myhorizon.solorient.com.au/Horizon/'
collector.domain      = 'horizondap'
collector.comment_url = 'mailto:council@walcha.nsw.gov.au'
collector.period      = 'thismonth'

collector.getRecords.each do |record|
#   p record
  puts "Saving record " + record['council_reference'] + ", " + record['address']
  ScraperWiki.save_sqlite(['council_reference'], record)
end
