require'csv'

class Gossip

    attr_accessor :author, :content

    def initialize(author,content)
        @author = author
        @content = content
    end

    def save
        CSV.open("./db/gossip.csv", "ab") do |csv|
          csv << [@author, @content]
        end
      end

    def self.all
        all_gossips = []
        CSV.read("./db/gossip.csv").each do |csv_line|
          all_gossips << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips
      end

    def self.find(id)
       csvfile =  CSV.read("./db/gossip.csv")
       return  csvfile[id.to_i].join("\n").split()
        end

    def self.update(id,content)
        rows_array = CSV.read("./db/gossip.csv")

        rows_array.each.with_index() do |row, index| 
            if index == id.to_i
                puts "oui"
                puts id.to_i
                row[1] = content.to_s
            else 
                puts 'non'
        end
    end
        CSV.open("./db/gossip.csv", 'wb') { |csv| rows_array.each{|row| csv << row}}

     end

end


