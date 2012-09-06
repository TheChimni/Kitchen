Recipe.destroy_all

recipe1 = Recipe.create!(:title => 'Baingan ka Bharta',
               :synopsis => 'Scrumptious smoked aubergine mash made from simple ingredients, a popular choice of North India',
               :ingredient_list => 'secret',
               :preparation_method => 'secret')
RecipePhoto.create!(:recipe => recipe1, :title => 'Baingan ka Bharta', :image => File.open('db/pictures/baingankabharta1.jpg'))
RecipePhoto.create!(:recipe => recipe1, :title => 'Baingan ka Bharta', :image => File.open('db/pictures/baingankabharta2.jpg'))

recipe2 = Recipe.create!(:title => 'Dal Makhni',
               :synopsis => "Mixture of various lentils with a touch of cream, this traditional recipe is a well kept secret of every 'Daadiji' (granny) in a Punjabi family",
               :ingredient_list => 'secret',
               :preparation_method => 'secret')
RecipePhoto.create!(:recipe => recipe2, :title => 'Dal Makhni', :image => File.open('db/pictures/IMG_2785.jpg'))

recipe3 = Recipe.create!(:title => 'Bhindi',
               :synopsis => 'Bhindi (Okra) with just green chillies, garlic, and tomatoes (optional), cooked all across India but this is my take on it',
               :ingredient_list => 'secret',
               :preparation_method => 'secret')
RecipePhoto.create!(:recipe => recipe3, :title => 'Bhindi', :image => File.open('db/pictures/IMG_2787.jpg'))

shepu_description =
"\"Zanzaneet\" is all about rustic home cooking with fresh and simple inredients just as it's cooked at home - with less faffing about with loads of ingredients but more emphasis given on trying to retain the distinctive flavour of each ingredient being used in the food. Whilst doing this, I like to make sure the dish comes out flavourful and spicy as it is made across India which essentially is the theme of most of my recipes - 'Zanzaneet' meaning 'spicy, vibrant yet full of flavour'. Hence the name 'Zanzaneet' of this website. Very apt to my style of cooking. 

Ok, enough of digression and let's talk about this recipe from Maharashtra called 'Shepu chi bhaji'. And if I were to translate it in English literally, I would have to borrow a word from Hindi that would categorise this recipe as a 'Sabzi' which only means a dry dish made from any vegetable. No, it's NOT a curry with gravy. So with my limited vocabulary in English, I have chosen to call it 'Dill Sabzi' which is simply a dry dish of Dill without gravy.

Dill Sabzi is essentially a Maharashtrian farmer's meal typically served with 'Bhakri' (A flat bread made of barley or millet). Given a farmer's daughter that I am, I couldn't resist sharing this dish. For all those garlic and chilli fans like me, note that there's no hard and fast rule when it comes to using these two ingredients in food, so feel free to bend the rules and use as much garlic and chilli as you like OR as little as you like. I won't judge you although I might not invite you round for dinner at mine if you come in the latter category :P. So here you go.."

shepu_ingredient_list =
"* 2 tablespoons of *vegetable oil*
* 2 big bunches of *Dill* (you can get big bunches of Dill from any Indian grocery store)
* 5-6 hot *green chillies* (by hot I mean Indian chillies or bird's eyes green chillies from any store)
* 4-5 cloves of *garlic*
* 3 tablespoons of *Moong Dal* (*Mung lentils*) or *Chana Dal* (*yellow split pea* lentils) as per your taste.
* Salt as per your taste."

shepu_preparation_method =
"1. Sort each bunch of Dill leaving the bigger stem aside but picking the leaves and delicate stalk. Collect the leafy parts with their delicate stalks in a bowl. This is 'sorting' the dill i.e seperating gritty and chunky stems from the tasty leaves and stalks.

1. Coarsly chop the collected stalks with leaves and put them a bowl and pour some cold water in it to wash out all the grit. I generally pour the water down the drain and repeat the process twice but leave the water in bowl the last time.

1. Chop some green chillies and garlic.

1. Pour some oil in a frying pan. After the oil gets hot, put the chillies and garlic into it.

1. Collect the chopped dill from the bowl containing water and start adding it into the frying pan until all the dill is filtered from the bowl. I know filtering the dill from a bowl of water could get messy, so if you want you can use colander or sieve. Also note that the quantity of dill might appear huge in the frying pan but it will shrink down to a very small portion as it cooks. I suggest using a bigger sized pan for cooking dill.

1. Stir the pan to mix all the contents evenly before covering it with a lid to cook it on medium flame for 10 minutes. Keep stirring in between to make sure the dill has enough moisture left and has not dried out. Keep cooking until the dill is soft, moist yet dry."

recipe4 = Recipe.create!(:title => 'Shepu chi bhaji (Dill Sabzi)',
               :synopsis => "Made with fresh dill, garlic and green chillies, a simple and healthy Maharashtrian farmer's meal",
               :description => shepu_description,
               :ingredient_list => shepu_ingredient_list,
               :preparation_method => shepu_preparation_method)
RecipePhoto.create!(:recipe => recipe4, :title => 'Dill Sabzi', :image => File.open('db/pictures/dill1.jpeg'))

recipe5_description =
"Originally from France, this dish is perfect for an evening meal with a nice bottle of wine. The sauce vierge is prepared from olive oil, tomatoe, lemon juice and torn basil. This is my take on the original recipe so I have used dill instead of basil and some smashed garlic as it suits my palette. Have a look here..."

recipe5_ingredient_list = 
"#### For the Salmon :

* 100g *salmon* fillet, skin removed
* 1 tbsp *olive oil*
* salt and freshly *ground black pepper*

#### For the sauce vierge :

* 1 tbsp *olive oil*
* 1 *tomato*, skin and seeds removed, cut into small dice
* 1/2 *lemon*, juice only
* 1/2 *lime*, juice only
* 1 clove of smashed *garlic* (optional)
* salt and freshly *ground black pepper*
* handful fresh *dill* leaves and stalks, torn. I used quite a lot of it because I like it :)

#### To serve :

* handful steamed *seaweed*
* oven glazed *ripe wine tomatoes* (optional)
* roasted *potatoes*"

recipe5_preparation_method = 
"1. For the Salmon, heat the olive oil in a griddle pan and cook the salmon for 5-7 minutes or until cooked through, turning it over halfway through. Season it with little salt and ground pepper as per your taste. (NB The salmon is cooked when the flesh is opaque.)

 1. For the sauce vierge, mix olive oil with chopped deseeded tomato with skin removed, lemon, lime and chopped dill leaves in a small bowl. Heat all the ingredients gently in a pan for 1-2 minutes until warmed through.

 1. To serve, put the salmon onto a plate with blushed wine tomatoes, steamed seaweed and roasted potatoes. Drizzle the sauce vierge around the outside of the plate."

recipe5 = Recipe.create!(:title => 'Salmon avec sauce vierge',
               :synopsis => "Mouthwatering and healthy salmon dish drizzled with sauce vierge and sea weed as a delicious accompaniment to go with - just what you need on a quiet friday night in.",
               :description => recipe5_description,
               :ingredient_list => recipe5_ingredient_list,
               :preparation_method => recipe5_preparation_method)
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/salmoncloseup1.jpg'))
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/salmonweed1.jpg'))
RecipePhoto.create!(:recipe => recipe5, :title => 'Salmon avec sauce vierge ', :image => File.open('db/pictures/wholeplate.jpg'))

User.destroy_all
User.create!(:email => 'rieethaa@zanzaneet.com', :password => 'secret', :password_confirmation => 'secret')
