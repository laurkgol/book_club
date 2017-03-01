# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Club.destroy_all
Meeting.destroy_all
Book.destroy_all
Member.destroy_all
User.destroy_all
Review.destroy_all

user1 = User.create(email: "test@email.com", password: "123456")
club1 = Club.create(name: "DC Book Club", start_date: "1/1/16")
meeting1 = Meeting.create(date: "1/2/17", host: "Laura Goldstein", location: "Navy Yard", book_id: 1, club_id: 1 )
meeting2 = Meeting.create(date: "3/26/17", host: "Susan Poklemba", location: "Adams Morgan", book_id: 2, club_id: 1)
book1 = Book.create(title: "Super Sad True Love Story", genre: "fiction", author: "Gary Shteyngart", photo_url: "https://upload.wikimedia.org/wikipedia/en/5/57/Super_Sad_True_Love_Story_book_cover.jpg", description: "The author of two critically acclaimed novels, The Russian Debutante’s Handbook and Absurdistan, Gary Shteyngart has risen to the top of the fiction world. Now, in his hilarious and heartfelt new novel, he envisions a deliciously dark tale of America’s dysfunctional coming years—and the timeless and tender feelings that just might bring us back from the brink.",link: "http://www.goodreads.com/book/show/7334201-super-sad-true-love-story", club_id: 1, meeting_id: 1)
book2 = Book.create(title: "Tokyo Vice", genre: "non-fiction", author: "Jake Adelstein", photo_url: "https://images.gr-assets.com/books/1320453731l/6658129.jpg", description:"From the only American journalist ever to have been admitted to the insular Tokyo Metropolitan Police press club: a unique, firsthand, revelatory look at Japanese culture from the underbelly up.", link: "https://www.goodreads.com/book/show/6658129-tokyo-vice", club_id: 1, meeting_id: 2)
member1 = Member.create(name: "Laura Goldstein", email: "laurag@email.com", street_address: "11 South Capitol St, SW", city: "Washington", state: "DC", zip:  "20003", photo_url: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/13445550_10104672628192498_1008526753107764760_n.jpg?oh=9b467918c4cbcb997e628c7ee94a526e&oe=5938CBD0", club_id: 1)
member2 = Member.create(name: "Susan Poklemba", email: "susan@email.com", street_address: "5 Columbia Road", city: "Washington", state: "DC", zip: "20005", photo_url: "https://scontent-sjc2-1.xx.fbcdn.net/v/t1.0-1/p160x160/15590046_10105555390429898_6512084356769845760_n.jpg?oh=d8a3264085cc5950e4e1d8fc13096400&oe=59339F25",club_id: 1)
review1 = Review.create(rating: 5, comment: "great book!", book_id: 1, user_id: 1)
