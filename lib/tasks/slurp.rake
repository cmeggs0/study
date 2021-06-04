namespace :slurp do
  desc "TODO"
  task schools: :environment do
      require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "schools.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        s = School.new
        s.id = row["id"]
        s.name = row["name"]
        s.created_at = row["created_at"]
        s.updated_at = row["updated_at"]
        s.save
        puts "#{s.name} saved"
      end
  end

end
