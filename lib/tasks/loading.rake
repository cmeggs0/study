namespace :loading do
  desc "TODO"
  task curriculums: :environment do
      require "csv"

      csv_text = File.read(Rails.root.join("lib", "csvs", "booth_curriculums.csv"))
      csv = CSV.parse(csv_text, :headers => true, :encoding => "ISO-8859-1")
      csv.each do |row|
        c = Curriculum.new
        c.professor_id = row["professor_id"]
        c.course_id = row["course_id"]
        c.save
        puts "#{c.id} saved"
      end

      puts "There are now #{Curriculum.count} rows in the curriculums table"
  end

end
