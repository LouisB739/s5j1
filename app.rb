

"CSV.read("./db/gossip.csv").each_with_index do |csv_line,index|
    if index == id.to_i
        CSV.open("./db/gossip2.csv", "a") do |csv|
            csv << [csv_line[0], content.to_s]
           
          end
    else
    CSV.open("./db/gossip2.csv", "a") do |csv|
        csv << [csv_line[0], csv_line[1]]
    end
end"

  