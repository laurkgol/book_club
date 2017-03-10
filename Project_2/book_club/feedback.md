# Project 2 Evaluation

## Technical Requirements
**3: Excelling**
>Includes many well-structured models, and advanced functionality such as authorization, 3rd-party API integration, or other technology not covered in class

## Creativity and Interface
**3: Excelling**
>The app is fully responsive, incorporates outside technologies such as Flexbox. App incorporates modern UI themes, and adds unique flair.

## Code Quality
**2: Performing**
>Code is well-formatted, well-named, and contains few style / quality issues

## Deployment and Functionality
**2: Performing**
>Application contains no major errors, is deployed correctly, and contains a custom Heroku app name appropriate for the app.

## Planning / Process / Submission
**2: Performing**
>Submission contains clear evidence of planning, adequate documentation, include all from previous category, as well as additional information such as unsolved issues.

## Code Comments
```diff
diff --git a/Project_2/book_club/app/assets/stylesheets/application.css b/Project_2/book_club/app/assets/stylesheets/application.css
index 01b3c7a..58c1ccd 100644
--- a/Project_2/book_club/app/assets/stylesheets/application.css
+++ b/Project_2/book_club/app/assets/stylesheets/application.css
@@ -17,6 +17,7 @@ main{
   align-items: stretch;

 }
+/*Good implementation of flexbox*/


 #b{
@@ -39,7 +40,7 @@ a:hover{
   font-size: 15pt;
 }

-
+/*I really like the pastel color scheme here*/

 hr {
   color: #B23057;
@@ -124,6 +125,8 @@ sidebar{
 /*.members{
:
diff --git a/Project_2/book_club/app/assets/stylesheets/application.css b/Project_2/book_club/app/assets/stylesheets/application.css
index 01b3c7a..58c1ccd 100644
--- a/Project_2/book_club/app/assets/stylesheets/application.css
+++ b/Project_2/book_club/app/assets/stylesheets/application.css
@@ -17,6 +17,7 @@ main{
   align-items: stretch;

 }
+/*Good implementation of flexbox*/


 #b{
@@ -39,7 +40,7 @@ a:hover{
   font-size: 15pt;
 }

-
+/*I really like the pastel color scheme here*/

:
diff --git a/Project_2/book_club/app/assets/stylesheets/application.css b/Project_2/book_club/app/assets/stylesheets/application.css
index 01b3c7a..58c1ccd 100644
--- a/Project_2/book_club/app/assets/stylesheets/application.css
+++ b/Project_2/book_club/app/assets/stylesheets/application.css
@@ -17,6 +17,7 @@ main{
   align-items: stretch;

 }
+/*Good implementation of flexbox*/


 #b{
@@ -39,7 +40,7 @@ a:hover{
   font-size: 15pt;
 }

-
+/*I really like the pastel color scheme here*/

 hr {
   color: #B23057;
 AndrewWhitley ~/wdi/sandbox/book_club/Project_2/book_club (master)
$ git diff origin master
diff --git a/Project_2/book_club/app/assets/stylesheets/application.css b/Project_2/book_club/app/assets/stylesheets/application.css
index 01b3c7a..58c1ccd 100644
--- a/Project_2/book_club/app/assets/stylesheets/application.css
+++ b/Project_2/book_club/app/assets/stylesheets/application.css
@@ -17,6 +17,7 @@ main{
   align-items: stretch;

 }
+/*Good implementation of flexbox*/


 #b{
@@ -39,7 +40,7 @@ a:hover{
   font-size: 15pt;
 }

-
+/*I really like the pastel color scheme here*/

 hr {
   color: #B23057;
@@ -124,6 +125,8 @@ sidebar{
 /*.members{
   background-color: #CC144C;
   }*/
+
+  /*Generally try to clean out out any commented out code before sending to production*/
 .books{
   background-color: #19CBFF;
 }
@@ -165,12 +168,13 @@ ul{

 .book_table{
   display: flex;
-  align-content: space-between;;
+  align-content: space-between;
+  /*Extra semicolon above. */
 }
 .book_description{
   margin: 10pt;
 }
-
+/*Good use of clearfix*/
 .clearfix:after {
   visibility: hidden;
   display: block;
diff --git a/Project_2/book_club/app/controllers/application_controller.rb b/Project_2/book_club/app/controllers/application_controller.rb
index 0800f82..2ed1dc2 100644
--- a/Project_2/book_club/app/controllers/application_controller.rb
+++ b/Project_2/book_club/app/controllers/application_controller.rb
@@ -1,5 +1,6 @@
 class ApplicationController < ActionController::Base
   before_action :authenticate_user!
-
+  # Good job abstracting user authentication to the application
+  # controller using before_action
   protect_from_forgery with: :exception
 end
diff --git a/Project_2/book_club/app/controllers/books_controller.rb b/Project_2/book_club/app/controllers/books_controller.rb
index b8ce2cc..9118c3b 100644
--- a/Project_2/book_club/app/controllers/books_controller.rb
+++ b/Project_2/book_club/app/controllers/books_controller.rb
@@ -5,9 +5,10 @@ class BooksController < ApplicationController

   def show
     @book = Book.find(params[:id])
-    @sum_rating = @book.reviews.reduce do |sum, rating|
-        sum + rating
+    @sum_rating = @book.reviews.reduce(0) do |sum, review|
+        sum + review.rating
       end
+      # A few corrections above to made .reduce work like intended here
       @average_rating = @sum_rating / @book.reviews.length
       @meeting = Meeting.find(params[:meeting_id])
       @club = Club.find(@book.club_id)
diff --git a/Project_2/book_club/app/controllers/clubs_controller.rb b/Project_2/book_club/app/controllers/clubs_controller.rb
index c1bfc18..4011657 100644
--- a/Project_2/book_club/app/controllers/clubs_controller.rb
+++ b/Project_2/book_club/app/controllers/clubs_controller.rb
@@ -23,6 +23,7 @@ class ClubsController < ApplicationController
     if @club.user == current_user
         @club.update(club_params)
     else
+      # Nice job checking user permissions for editing and flash for notifications
       flash[:alert] = "Only the creater can edit"
     end

diff --git a/Project_2/book_club/app/controllers/meetings_controller.rb b/Project_2/book_club/app/controllers/meetings_controller.rb
index 10670ce..d3bbbfc 100644
--- a/Project_2/book_club/app/controllers/meetings_controller.rb
+++ b/Project_2/book_club/app/controllers/meetings_controller.rb
@@ -1,7 +1,7 @@
 class MeetingsController < ApplicationController
   def index
     @meetings = Meeting.all
-
+    # From what I can tell, this controller action is not used. IF so, you can remove it
   end
   def new
       @club = Club.find(params[:club_id])
diff --git a/Project_2/book_club/app/models/book.rb b/Project_2/book_club/app/models/book.rb
index 0e24c58..bd7e5ff 100644
--- a/Project_2/book_club/app/models/book.rb
+++ b/Project_2/book_club/app/models/book.rb
@@ -1,5 +1,6 @@
 class Book < ApplicationRecord
   has_many :reviews
   belongs_to :meetings, optional: true
+  # Good use here of optional associations
   belongs_to :user
 end
diff --git a/Project_2/book_club/app/models/user.rb b/Project_2/book_club/app/models/user.rb
index abed1f5..6d32b27 100644
--- a/Project_2/book_club/app/models/user.rb
+++ b/Project_2/book_club/app/models/user.rb
@@ -1,4 +1,6 @@
 class User < ApplicationRecord
+  # Good use of devise here for setting up your User model
+
   # Include default devise modules. Others available are:
   # :confirmable, :lockable, :timeoutable and :omniauthable
   devise :database_authenticatable, :registerable,
@@ -8,4 +10,6 @@ class User < ApplicationRecord
   has_many :clubs
   has_many :meetings
   has_many :members
+  # Does a user have many members? Or does a user have many clubs that,
+  # in turn, have many members?
 end
diff --git a/Project_2/book_club/app/views/books/new.html.erb b/Project_2/book_club/app/views/books/new.html.erb
index 5f36508..c681c33 100644
--- a/Project_2/book_club/app/views/books/new.html.erb
+++ b/Project_2/book_club/app/views/books/new.html.erb
@@ -1,7 +1,7 @@
 <h1> Meeting on <%= @meeting.date %>
   <h2>New Book</h2>
+  <%= form_for [@meeting, @book] do |f| %>
   <ul>
-    <%= form_for [@meeting, @book] do |f| %>
     <li>  <%= f.label :title %></li>
     <li> <%= f.text_field :title %></li>

diff --git a/Project_2/book_club/app/views/clubs/new.html.erb b/Project_2/book_club/app/views/clubs/new.html.erb
index 7ec9d66..aa4a42f 100644
--- a/Project_2/book_club/app/views/clubs/new.html.erb
+++ b/Project_2/book_club/app/views/clubs/new.html.erb
@@ -14,3 +14,6 @@
 <li>  <%= f.submit %> </li>
 </ul>
 <%end%>
+<%# Consider creating a partial form view in this folder and then reusing it
+(rendering it) both here and in the edit view. Same goes for any model that has
+both new and edit views %>
diff --git a/Project_2/book_club/app/views/layouts/application.html.erb b/Project_2/book_club/app/views/layouts/application.html.erb
index a9e037c..1cb8c87 100644
--- a/Project_2/book_club/app/views/layouts/application.html.erb
+++ b/Project_2/book_club/app/views/layouts/application.html.erb
@@ -6,6 +6,7 @@
 <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
 <link href="https://fonts.googleapis.com/css?family=Open+Sans" rel="stylesheet">
 <%= stylesheet_link_tag    'application', media: 'all', 'data-turbolinks-track': 'reload' %>
+<%# Try to make your indenting more uniform and indicative of DOM level %>
     <%= javascript_include_tag 'application', 'data-turbolinks-track': 'reload' %>
   </head>

@@ -13,7 +14,7 @@
     <div id = "wrapper">
       <nav>
         <h1 id = "title"><%= link_to "BookClub", root_path %> <%= image_tag('books.png', :class => 'logo', :id => 'books') %> <%= image_tag('wine.png', :class => 'logo', :id => 'wine')  %></h1>
-
+        <%# well formatted and styled navigation bar %>
         <div class = "sign" >
             <% if !current_user %>
            <%= link_to "Sign up", new_user_registration_path %> |
diff --git a/Project_2/book_club/app/views/meetings/index.html.erb b/Project_2/book_club/app/views/meetings/index.html.erb
index e69de29..84529c7 100644
--- a/Project_2/book_club/app/views/meetings/index.html.erb
+++ b/Project_2/book_club/app/views/meetings/index.html.erb
@@ -0,0 +1 @@
+<%# You don't need to create views for unused / nonexistent controller actions  %>
diff --git a/Project_2/book_club/app/views/meetings/show.html.erb b/Project_2/book_club/app/views/meetings/show.html.erb
index 1651afd..4815a86 100644
--- a/Project_2/book_club/app/views/meetings/show.html.erb
+++ b/Project_2/book_club/app/views/meetings/show.html.erb
@@ -25,6 +25,8 @@
       <%  @sum_ratings = @reviews.reduce(0) { |sum, review| sum + review.rating } %>
       <%  @average_rating = @sum_ratings / @reviews.length %>
       <p>Average Rating: <%= @average_rating %></p>
+      <%# Really impressive code here. Think about moving some of this logic (the reduce
+      in particular) to your controller instead and have it passed in as variables. %>
   <% end %>

     <% end %>
diff --git a/Project_2/book_club/app/views/members/index.html.erb b/Project_2/book_club/app/views/members/index.html.erb
index e69de29..e992827 100644
--- a/Project_2/book_club/app/views/members/index.html.erb
+++ b/Project_2/book_club/app/views/members/index.html.erb
@@ -0,0 +1 @@
+<%# Same here. If it is unused, delete it before pushing to production. %>
diff --git a/Project_2/book_club/config/routes.rb b/Project_2/book_club/config/routes.rb
index 6466643..ee43349 100644
--- a/Project_2/book_club/config/routes.rb
+++ b/Project_2/book_club/config/routes.rb
@@ -16,4 +16,7 @@ resources :clubs do
   end

 end
+
+# Excellent use of root to, resources, and nested routes for setting up your applications routes
+
   # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
diff --git a/Project_2/book_club/db/schema.rb b/Project_2/book_club/db/schema.rb
index 3c6ff51..f90dadd 100644
--- a/Project_2/book_club/db/schema.rb
+++ b/Project_2/book_club/db/schema.rb
@@ -23,6 +23,7 @@ ActiveRecord::Schema.define(version: 20170302155943) do
     t.string  "link"
     t.string  "genre"
     t.string  "rating"
+    # shouldn't rating be an integer or decimal?
     t.integer "club_id"
     t.integer "meeting_id"
     t.integer "user_id"
@@ -41,6 +42,7 @@ ActiveRecord::Schema.define(version: 20170302155943) do

   create_table "meetings", force: :cascade do |t|
     t.string  "date"
+    # for things pertaining to dates or times, best practice is to use datetime data type
     t.string  "location"
     t.string  "host"
     t.integer "club_id"
diff --git a/Project_2/book_club/db/seeds.rb b/Project_2/book_club/db/seeds.rb
diff --git a/Project_2/book_club/db/seeds.rb b/Project_2/book_club/db/seeds.rb
index beca05d..20150a6 100644
--- a/Project_2/book_club/db/seeds.rb
+++ b/Project_2/book_club/db/seeds.rb
@@ -16,3 +16,12 @@ book2 = Book.create!(title: "Tokyo Vice", genre: "non-fiction", author: "Jake Ad
 member1 = Member.create!(name: "Laura Goldstein", email: "laurag@email.com", street_address: "11 South Capitol St, SW", city: "Washington", state: "DC", zip:  "20003", photo_url: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/13445550_10104672628192498_1008526753107764760_n.jpg?oh=9b467918c4cbcb997e628c7ee94a526e&oe=5938CBD0", club_id: 1, user_id: 1)
 member2 = Member.create!(name: "Susan Poklemba", email: "susan@email.com", street_address: "5 Columbia Road", city: "Washington", state: "DC", zip: "20005", photo_url: "https://scontent-sjc2-1.xx.fbcdn.net/v/t1.0-1/p160x160/15590046_10105555390429898_6512084356769845760_n.jpg?oh=d8a3264085cc5950e4e1d8fc13096400&oe=59339F25",club_id: 1, user_id: 1)
 review1 = Review.create!(rating: 5, comment: "great book!", book_id: 1, user_id: 1)
+
+# Good practice here using the (!) operator on create to ensure error notifications.
+# As a note, if you are instantiating multiple instances of a given model, you can
+# use this syntax:
+#
+# Member.create!([
+#   {name: "Laura Goldstein", email: "laurag@email.com", street_address: "11 South Capitol St, SW", city: "Washington", state: "DC", zip:  "20003", photo_url: "https://scontent-iad3-1.xx.fbcdn.net/v/t1.0-9/13445550_10104672628192498_1008526753107764760_n.jpg?oh=9b467918c4cbcb997e628c7ee94a526e&oe=5938CBD0", club_id: 1, user_id: 1},
+#   {name: "Susan Poklemba", email: "susan@email.com", street_address: "5 Columbia Road", city: "Washington", state: "DC", zip: "20005", photo_url: "https://scontent-sjc2-1.xx.fbcdn.net/v/t1.0-1/p160x160/15590046_10105555390429898_6512084356769845760_n.jpg?oh=d8a3264085cc5950e4e1d8fc13096400&oe=59339F25",club_id: 1, user_id: 1}
+# ])
```
