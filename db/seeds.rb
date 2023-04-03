User.destroy_all
Post.destroy_all
Tag.destroy_all

toto = User.create!(nickname: "Toto", email: "toto@mail.com", password: "password", password_confirmation: "password")

5.times do
  post = Post.new(content: "Updated the CSS on homepage")
  post.user = toto
  post.save!
  p post
  post.update_attribute(:date, Date.today + rand(1..10))
end
