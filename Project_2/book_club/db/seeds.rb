# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

club1 = Club.create(name: "DC Book Club")
meeting1 = Meeting.create(date: "1/2/16", member_id: 1, book_id: 1, club_id: 1 )
book1 = Book.create(title: "Super Sad True Love Story", author: "Gary Shteyngart", photo_url: "https://upload.wikimedia.org/wikipedia/en/5/57/Super_Sad_True_Love_Story_book_cover.jpg", description: "The author of two critically acclaimed novels, The Russian Debutante’s Handbook and Absurdistan, Gary Shteyngart has risen to the top of the fiction world. Now, in his hilarious and heartfelt new novel, he envisions a deliciously dark tale of America’s dysfunctional coming years—and the timeless and tender feelings that just might bring us back from the brink.",link: "http://www.goodreads.com/book/show/7334201-super-sad-true-love-story", club_id: 1, meeting_id: 1)
member1 = Member.create(name: "Laura Goldstein", email: "laurag@email.com", street_address: "11 South Capitol St, SW", city: "Washington", state: "DC", zip:  "20003", photo_url: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/13445550_10104672628192498_1008526753107764760_n.jpg?oh=9b467918c4cbcb997e628c7ee94a526e&oe=5938CBD0", club_id: 1)
