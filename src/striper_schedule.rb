associate_avalibility_file_path = src/csv/avaliability.csv
associate_sph_file_path = src/csv/sales_per_hour.csv
shift_details_file_path = src/csv/shift_details.csv

# The function used to read a file and returns the array of objects
def read_input_file (file_name, objType)
  obj_arr = []
  file_read = CSV.read(file_name)
  file_read.shift
    file_read.each do |row|
        obj_arr << objType.new(row[0], row[1], row[2], row[3], row[4])
    end
  return obj_arr
end

def main()
    # At a high level, we need to read the input files, and create the associated objects
    # Then for each day of the week from the shift_details, we need to check and make sure that we are less than the maximum number of hours
    # Then we want to get the associate with the highest sales per hour,
    # Check if they are avaliable (open, close, none, both)
    # Check if they are less than the maximum number of hours, and schedule the associate for an open or close or none accordingly
    # If the associate reached the maximum number of hours pop them from structure holding the SPH and continue the process until all the days are scheduled
    # Then we want to output the schedule to a file    

    avaliability_arr = read_input_file(associate_avalibility_file_path, Avaliability)
    sph_arr = read_input_file(associate_sph_file_path, SalesPerHour)
    shift_details_arr = read_input_file(shift_details_file_path, Day)

    currentHours = 0
    for day in shift_details_arr
        while (currentHours < day.max_hours):
            currentAssociate = sph_arr[0]
            if currentAssociate.scheduled_hours + 6 >= currentAssociate.max_hours
                sph_arr.shift
            elsif currentAssociate.avalibility == "both" && currentAssociate.scheduled_hours < currentAssociate.max_hours
                currentAssociate.scheduled_hours += 8
                currentHours += 8
                currentAssociate.shift += day.date + "Open"
                currentAssociate.avaliable = "none"
            elsif currentAssociate.avalibility == "open" && currentAssociate.scheduled_hours < currentAssociate.max_hours
                currentAssociate.scheduled_hours += 8
                currentHours += 8
                currentAssociate.shift += day.date + "Open"
                currentAssociate.avaliable = "none"
            elsif currentAssociate.avalibility == "close" && currentAssociate.scheduled_hours < currentAssociate.max_hours
                currentAssociate.scheduled_hours += 8
                currentHours += 8
                currentAssociate.shift += day.date + "Close"
                currentAssociate.avaliable = "none"
            else
                sph_arr.shift
            end
        end
    end

end