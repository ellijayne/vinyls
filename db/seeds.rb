#user sseds
User.destroy_all
u1 = User.create :username => 'elli_jayne', :email => 'ellijayne.m.willard@gmail.com'

u2 = User.create :username => 'usagi', :email => 'usagi@sailorguardian.com'

#album seed info
Album.destroy_all

lp1 = Album.create :title => 'Take Off Your Pants And Jacket', :date => '2001-12-06', :tracks => 'Anthem Part, Two Online Songs, First Date, Happy Holidays You Bastard, Story of a Lonely Guy, The Rock Show, Stay Together for the Kids, Roller Coaster, Reckless Abandon, Every Time I Look for You, Give Me One Good Reason, Shut Up, Please Take Me Home, Time to Break Up'

lp2 = Album.create :title => 'Go Farther in Lightness', :date => '2017-08-18'

lp3 = Album.create :title => 'Kiss', :date => '2012-09-14'

#artist seed info
Artist.destroy_all

a1 Artist.create :name => 'Blink 182'
a2 Artist.create :name => 'Gang of Youths'
a3 = Artist.create :name => 'Carly Rae Jepsen'

#pressing seed info
Pressing.destroy_all

p1 = Pressing.create :year => 2014, :limited => true, :color => "white", :weight => "180 grams", :gatefold => true, :remastered => true, :quantity_pressed => 1500, :virgin_vinyl => false, :lp_qty => 1

p2 = Pressing.create :year => 2017, :limited => true, :color => 'clear', :weight => "180 grams", :gatefold => true, :lp_qty => 2

p3 = Pressing.create :year => 2013, :limited => true, :color => 'picture disc', :lp_qty => 1

#associations
#artists and albums
a1.albums << lp1
a2.albums << lp2
a3.albums << lp3

#users and albums
u1.albums << lp1 << lp2
u2.albums << lp3 << lp1
