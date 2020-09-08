Court.destroy_all

courts = GetCourts.new.get_courts
courts.each do |court|
    attributes = {
        "prop_id" => court["Prop_ID"],
        "name" => court["Name"],
        "location" => court["Location"],
        "phone" => court["Phone"],
        "number_of_courts" => court["Courts"],
        "indoor_outdoor" => court["Indoor_Outdoor"],
        "court_type" => court["Tennis_Type"],
        # "Accessible" => court["accessible"],
        "info" => court["Info"],
        "latitude" => court["lat"],
        "longitude" => court["lon"],
    }

    Court.create(attributes)

end