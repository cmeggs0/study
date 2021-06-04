namespace :load do
  desc "TODO"
  task professors: :environment do
    require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "booth_professors.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        p = Professor.new
        p.first_name = row["first_name"]
        p.last_name = row["last_name"]
        p.bio = row["bio"]
        p.save
        puts "#{p.first_name} saved"
      end
  end

end
