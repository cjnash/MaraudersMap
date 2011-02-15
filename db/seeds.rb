# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

sections = 
  [
  {:name => 'Membership', :path => 'membership'},
  {:name => 'Travel', :path => 'travel'},
  {:name => 'Auto & Driving', :path => 'automotive'},
  {:name => 'Registries', :path => 'registries'},
  {:name => 'Insurance', :path => 'insurance'},
  {:name => 'Deals & Discounts', :path => 'deals-and-discounts'},
  {:name => 'Driver Education', :path => 'driver-education'},
  {:name => 'Financial', :path => 'financial'},
  {:name => 'Community & AMA', :path => 'community-and-ama'}
  ]
  
sections.each do |section|
  Section.new(section).save
end

users = [
  {:username => 'amanda.doucette', :password => 'hM0vo4rJk8XVu4Hd', :email => 'amanda.doucette@ama.ab.ca'},
  {:username => 'brad.grier', :password => 'C4iU3yacLd4a7af1', :email => 'brad.grier@ama.ab.ca'},
  {:username => 'christopher.nash', :password => 'ZWXKVsm2M654x80R', :email => 'christopher.nash@ama.ab.ca'},
  {:username => 'darrell.winwood', :password => '1B624Mh46jw1R58N', :email => 'darrell.winwood@ama.ab.ca'},
  {:username => 'doug.stewart', :password => '7Z24W41467vx2Ji8', :email => 'doug.stewart@ama.ab.ca'},
  {:username => 'dwain.sager', :password => 'B6b49mIJbOOL5dVC', :email => 'dwain.sager@ama.ab.ca'},
  {:username => 'esci.cagaoan', :password => 'o6V1e09dh5xV6947', :email => 'esci.cagaoan@ama.ab.ca'},
  {:username => 'jason.buzzell', :password => 'V14rl4l2556UKp5d', :email => 'jason.buzzell@ama.ab.ca'},
  {:username => 'johnn.four', :password => 's76GE6P1863LRw8p', :email => 'johnn.four@ama.ab.ca'},
  {:username => 'krista.vieira', :password => 'zlyXArK96Gf4e0Is', :email => 'krista.vieira@ama.ab.ca'},
  {:username => 'laura.urbanowski', :password => '3kxYYS3t29Ji1Q6y', :email => 'laura.urbanowski@ama.ab.ca'},
  {:username => 'michael.beuken', :password => 'yb2125677b9347Tn', :email => 'michael.beuken@ama.ab.ca'},
  {:username => 'ruthann.raycroft', :password => '6pqG3Sg824E8590U', :email => 'ruthann.raycroft@ama.ab.ca'},
  {:username => 'sarah.vantassel', :password => 'C45816R1Wx1T56pD', :email => 'sarah.vantassel@ama.ab.ca'}
  ]
  
users.each do |user|
  User.new(user).save
end

section_editors = [
  {:username => 'amanda.doucette', :sections => ['Insurance']},
  {:username => 'brad.grier', :sections => ['Community & AMA']},
  {:username => 'christopher.nash', :sections => ['All']},
  {:username => 'darrell.winwood', :sections => ['Auto & Driving', 'Driver Education']},
  {:username => 'doug.stewart', :sections => ['Membership']},
  {:username => 'dwain.sager', :sections => ['Deals & Discounts']},
  {:username => 'esci.cagaoan', :sections => ['Travel']},
  {:username => 'jason.buzzell', :sections => ['Membership']},
  {:username => 'johnn.four', :sections => ['Community & AMA']},
  {:username => 'krista.vieira', :sections => ['Registries', 'Financial', 'Community & AMA']},
  {:username => 'laura.urbanowski', :sections => ['Insurance']},
  {:username => 'michael.beuken', :sections => ['All']},
  {:username => 'ruthann.raycroft', :sections => ['Deals & Discounts']},
  {:username => 'sarah.vantassel', :sections => ['Travel']}
  ]
  
section_editors.each do |editor|
  user = User.find_by_username(editor[:username])
  puts editor
  editor[:sections].each do |name|
    puts name
    if name == 'All'
      user.sections = Section.all
    else
      section = Section.find_by_name(name)
      user.sections << section unless user.sections.include?(section)
    end
  end
  user.save
end