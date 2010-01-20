require 'rubygems'
require 'amazon/aws/search'

include Amazon::AWS
include Amazon::AWS::Search

secretaryId = '4041658220644'
signalId = '7613059900349'
giJoeId = '4010884259841'

il = ItemLookup.new( 'EAN', { 'ItemId' => signalId, 'SearchIndex' => 'DVD' } )
rg = ResponseGroup.new( 'Medium' )

req = Request.new
req.locale = 'de'
resp = req.search(il, rg)

item  = resp.item_lookup_response.items.item
title = item.item_attributes.title
releaseDate = item.item_attributes.theatrical_release_date
directors = item.item_attributes.director
actors = item.item_attributes.actor
mediaType = item.item_attributes.binding

puts '========================'
puts "Medium: #{mediaType}"
puts "Title: #{title}"
puts "Release Date: #{releaseDate}"
if directors.size == 1
  puts "Director: #{directors[0]}"
else
  puts "Directors:"
  directors.each do |director|
    puts " -#{director}"
  end
end
puts "Actors:"
actors.each do |actor|
  puts " -#{actor}"
end
puts '========================'


#puts YAML::dump(resp.item_lookup_response.items.item.item_attributes.binding)