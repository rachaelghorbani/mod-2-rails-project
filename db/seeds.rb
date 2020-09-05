
courts = GetTennisCourts.new.get_courts
courts.each do |court|
    attributes = {
        "prop_id" => court["Prop_ID"],
        "name" => court["Name"],
        "location" => court["Location"],
        "phone" => court["Phone"],
        "courts" => court["Courts"],
        "indoor_outdoor" => court["Indoor_Outdoor"],
        "court_type" => court["Tennis_Type"],
        # "Accessible" => court["accessible"],
        "info" => court["Info"],
        # "lat" => court["latitude"],
        # "lon" => court["longitude"],
    }

    TennisCourt.create(attributes)

end