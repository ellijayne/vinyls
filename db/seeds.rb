#user sseds
User.destroy_all
user1 = User.create :username => 'elli_jayne', :email => 'ellijayne.m.willard@gmail.com', :password => 'chicken', :admin => true

user2 = User.create :username => 'usagi', :email => 'usagi@sailorguardian.com', :password => 'chicken'

#album seed info
Album.destroy_all

album1 = Album.create :title => 'Take Off Your Pants And Jacket', :date => '2001-12-06', :tracks => 'Anthem Part, Two Online Songs, First Date, Happy Holidays You Bastard, Story of a Lonely Guy, The Rock Show, Stay Together for the Kids, Roller Coaster, Reckless Abandon, Every Time I Look for You, Give Me One Good Reason, Shut Up, Please Take Me Home, Time to Break Up', :image => 'album_takeoffyourpants.jpg'

album2 = Album.create :title => 'Go Farther in Lightness', :date => '2017-08-18', :image => 'album_gofartherinlightness.jpg'

album3 = Album.create :title => 'High as Hope', :date => '2012-09-14'

#artist seed info
Artist.destroy_all

artist1 = Artist.create :name => 'Blink 182', :image => 'artist_blink182'
artist2 = Artist.create :name => 'Gang of Youths', :image => 'artist_gangofyouths'
artist3 = Artist.create :name => 'Carly Rae Jepsen'

#pressing seed info
Pressing.destroy_all

pressing1 = Pressing.create :year => 2014, :limited => true, :color => "white", :weight => "180 grams", :gatefold => true, :remastered => true, :quantity_pressed => 1500, :virgin_vinyl => false, :lp_qty => 1

pressing2 = Pressing.create :year => 2017, :limited => true, :color => 'clear', :weight => "180 grams", :gatefold => true, :lp_qty => 2

pressing3 = Pressing.create :year => 2013, :limited => true, :color => 'picture disc', :lp_qty => 1

puts "associating" * 10

#associations
#artists and albums
artist1.albums << album1 #putting album1 into artists 1 album section
artist2.albums << album2
artist3.albums << album3

#users and albums # FAVOURITES
user1.albums << album1 << album2
user2.albums << album3 << album1

#users and artists? dont know if this is favouriting???
user1.artists << artist1 << artist2
user2.artists << artist1 << artist3

# assoc pressings into albums
album1.pressings << pressing1
album2.pressings << pressing2
album3.pressings << pressing3
