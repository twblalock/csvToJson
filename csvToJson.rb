require "csv"
require "json"

out = []

CSV.foreach(ARGV[0], {:headers => true}) do |row|
    j = {}
    row.each do |header, value|
        if !j[header].nil?
            raise "Duplicate column header: #{header}"
        end
        j[header] = value
    end
    out << j
end

puts JSON.pretty_generate(out)
