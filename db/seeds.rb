Recipe.destroy_all

Recipe.create!(:title => 'Baingan ka Bharta',
               :description => 'Good old Punjabi food',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/Baingan.jpeg'))
Recipe.create!(:title => 'Shepu',
               :description => 'Marathi farmers food',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/Shepu.jpeg'))
Recipe.create!(:title => 'Dal Makhni',
               :description => 'Daadiji ki recipe',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/ShimlaMirch.jpeg'))
Recipe.create!(:title => 'Bhindi',
               :description => 'Eaten all over India',
               :ingredient_list => 'secret',
               :preparation_method => 'secret',
               :picture => File.open('db/pictures/MeduVada.jpeg'))

