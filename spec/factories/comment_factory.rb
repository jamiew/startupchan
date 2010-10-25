# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :comment do |f|
  f.entry_id 1
  f.user_id 1
  f.text "MyText"
end
