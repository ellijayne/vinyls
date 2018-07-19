#user sseds
User.destroy_all
user1 = User.create :username => 'elli_jayne', :email => 'ellijayne.m.willard@gmail.com', :password => 'chicken', :admin => true

user2 = User.create :username => 'brucey_Springsteen', :email => 'bruce@psringsteen.com', :password => 'chicken'

user3 = User.create :username => 'Ringo', :email => 'ringo@beatles.com', :password => 'chicken'

#album seed info
Album.destroy_all

album1 = Album.create :title => 'Take Off Your Pants And Jacket', :date => '2001-12-06', :tracks => 'Anthem Part, Two Online Songs, First Date, Happy Holidays You Bastard, Story of a Lonely Guy, The Rock Show, Stay Together for the Kids, Roller Coaster, Reckless Abandon, Every Time I Look for You, Give Me One Good Reason, Shut Up, Please Take Me Home, Time to Break Up', :image => 'album_takeoffyourpants.jpg'

album2 = Album.create :title => 'Go Farther in Lightness', :date => '2017-08-18', :image => 'album_gofartherinlightness.jpg'

album3 = Album.create :title => 'High as Hope', :date => '2012-09-14', :image => 'album-highas.jpg'

album4 = Album.create :title => 'Born In The USA', :date => '1984-06-04', :image => 'album-bornusa.jpeg'

album5 = Album.create :title => 'The Positions', :date => '2015-04-17', :image => 'album_positions.jpg'

album6 = Album.create :title => 'More Scared of You Than You Are Of Me', :date => '2017-04-07', :image => 'albums-morescared.jpg'

#artist seed info
Artist.destroy_all

artist1 = Artist.create :name => 'Blink 182', :image => 'artist_blink182'

artist2 = Artist.create :name => 'Gang of Youths', :image => 'artist_gangofyouths'

artist3 = Artist.create :name => 'Florence and the Machine', :image => 'artist-florence.jpeg'

artist4 = Artist.create :name => 'Bruce Springsteen', :image => 'artist-brucey.jpg'

artist5 = Artist.create :name => 'Smith Street Band', :image => 'artists-smithst.jpg'


#pressing seed info
Pressing.destroy_all

pressing1 = Pressing.create :year => 2014, :limited => true, :color => "white", :weight => "180 grams", :gatefold => true, :remastered => true, :quantity_pressed => 1500, :virgin_vinyl => false, :lp_qty => 1

pressing2 = Pressing.create :year => 2017, :limited => true, :color => 'clear', :weight => "180 grams", :gatefold => true, :lp_qty => 2

pressing3 = Pressing.create :year => 2018, :limited => true, :color => 'yellow', :lp_qty => 1

pressing4 = Pressing.create :year => 1984, :limited => false, :gatefold => true, :lp_qty => 2

pressing5 = Pressing.create :year => 2017, :limited => true, :color => 'gold', :lp_qty => 2

pressing6 = Pressing.create :year => 2017, :limited => true, :color => 'pink', :weight => '180g', :lp_qty => 2

#associations
#artists and albums
artist1.albums << album1 #putting album1 into artists 1 album section
artist2.albums << album2 << album5
artist3.albums << album3
artist4.albums << album4
artist5.albums << album6


#users and albums # FAVOURITES
user1.albums << album1 << album2 << album3
user2.albums << album3 << album1 << album4 << album6 << album5 <<album2
user3.albums << album5 << album3 << album6

#users and artists? dont know if this is favouriting???
user1.artists << artist1 << artist2 << artist3
user2.artists << artist1 << artist3 << artist4 << artist6
user3.artists << artist5 << artist3 << artist3

# assoc pressings into albums
album1.pressings << pressing1
album2.pressings << pressing2
album3.pressings << pressing3
album4.pressings << pressing4
album5.pressings << pressing5
album6.pressings << pressing6
