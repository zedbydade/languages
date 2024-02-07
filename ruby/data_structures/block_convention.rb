# {  } notation for pure methods.

# make a new array, with the contents of the old array stringified and whitespace trimmed
arr2 = arr.map{|x| x.to_s.trim }

# Read from the world, but don't change the world
options = open('options.yml') { |f|
  YAML.load(f)
}

# Generate some XML and assign it to a variable
xml = Nokogiri::XML::Builder.new { |xml|
  xml.root {
    xml.products {
      xml.widget {
        xml.id_ "10"
        xml.name "Awesome widget"
      }
    }
  }.to_xml
}

# Hash fetch with default value
err_count = stats.fetch(:error_count) { 0 }

# Do notation for another type of methods 

# Write output to a file
open("$0.pid", 'w+') do |f|
  f.write($$.to_s)
end

