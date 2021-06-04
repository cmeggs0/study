namespace :loads do
  desc "TODO"
  task schools: :environment do
    require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "schools.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        s = School.new
        s.name = row["name"]
        s.save
        puts "#{s.name} saved"
      end
  end

end
