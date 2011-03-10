Factory.define :user do |u|
  u.name 'John'
end

Factory.define :user_poll, :class => User do |p|
  p.name 'John'
  p.polls [Poll.create(:title => "poll")]
end
