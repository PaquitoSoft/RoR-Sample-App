# By using the symbol ':user', we get the Factory Girl gem to simulate the user model
Factory.define :user do |user|
  user.name                     'Michael'
  user.email                    'mhartl@example.com'
  user.password                 'foobar'
  user.password_confirmation    'foobar'
end

Factory.sequence :email do |n|
  "person-#{n}@example.com"
end