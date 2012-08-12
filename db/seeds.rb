Recipe.destroy_all

Recipe.create!(:title => 'Baingan ka Bharta',
               :synopsis => 'Scrumptious smoked aubergine mash made from simple ingredients, a popular choice of North India',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/Baingan.jpeg'))
Recipe.create!(:title => 'Shepu',
               :synopsis => "Made with fresh dill, garlic and green chillies, a simple and healthy Maharashtrian farmer's meal",
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/Shepu.jpeg'))
Recipe.create!(:title => 'Dal Makhni',
               :synopsis => "Mixture of various lentils with a touch of cream, this traditional recipe is a well kept secret of every 'Daadiji' (granny) in a Punjabi family",
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/ShimlaMirch.jpeg'))
Recipe.create!(:title => 'Bhindi',
               :synopsis => 'Bhindi (Okra) with just green chillies, garlic, and tomatoes (optional), cooked all across India but this is my take on it',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/MeduVada.jpeg'))

User.destroy_all
User.create!(:email => 'admin@example.com', :password => 'secret', :password_confirmation => 'secret')
