# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
State.destroy_all
state_name = ["Andaman and Nicobar Islands","Andhra Pradesh","Arunachal Pradesh","Assam","Bihar","Chandigarh","Chhattisgarh",
		"Dadra and Nagar Haveli","Daman and Diu","Delhi","Goa","Gujarat","Haryana","Himachal Pradesh",
		"Jammu and Kashmir","Jharkhand","Karnataka","Kerala","Lakshadweep","Madya Pradesh","Maharashtra",
		"Manipur","Meghalaya","Mizoram","Nagaland","Orissa","Pondicherry","Punjab","Rajasthan","Sikkim",
		"Tamil Nadu","Telangana","Tripura","Uttar Pradesh","West Bengal"]
35.times do |i|
State.create("_id" => i, name: state_name[i],
	forestarea: {tropical: (Random.rand(100)),subtropical: (Random.rand(100)),mediterranean: (Random.rand(100)),temperate: (Random.rand(100))},
	literacyrate: {men: (Random.rand(100)),woman: (Random.rand(100)),others: (Random.rand(100))},
	mentowoman: {urban:  (Random.rand(100)),suburban: (Random.rand(100)), rural: (Random.rand(100))},
	employment: {urban: (Random.rand(100)),suburban: (Random.rand(100)), rural: (Random.rand(100))}
 )
end