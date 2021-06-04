namespace :slurp do
  desc "TODO"
  task courses: :environment do
      require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "booth_courses.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        c = Course.new
        c.quarter = row["quarter"]
        c.title = row["title"]
        c.course_number = row["course_number"]
        c.section_number = row["section_number"]
        c.schedule = row["schedule"]
        c.description = row["description"]
        c.program = row["program"]
        c.school_id = row["school_id"]
        c.save
        puts "#{c.title} saved"
      end
  end

end
