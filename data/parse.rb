require "csv"

contents = File.read("raw.csv")
csv = CSV.parse(contents)

tableno = 0

csv = csv.map do |entry|
  [
    tableno += 1,
    entry[0],
    entry[1],
    entry[6]
  ]
end

csv[0] = ["table", "project", "link", "sponsors"]

f = File.open("data.csv", "w+")
f.write(csv.compact.map(&:to_csv).join("")[0..-2])
f.close

puts "Parsed to data.csv"