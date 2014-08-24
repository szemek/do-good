ActiveRecord::Base.record_timestamps = false
begin
  Deed.find_or_create_by({
    person: 'David',
    action: "I shared an umbrella with some stranger during today's heavy rain so she can go back home",
    created_at: DateTime.new(2014, 7, 21, 16, 4),
    updated_at: DateTime.new(2014, 7, 21, 16, 4)
  })
  Deed.find_or_create_by({
    person: 'Tom',
    action: "I brought some brownie to the office and shared it with my colleagues",
    created_at: DateTime.new(2014, 7, 21, 15, 57),
    updated_at: DateTime.new(2014, 7, 21, 15, 57)
  })
  Deed.find_or_create_by({
    person: 'Marta',
    action: "I'd made coffee to my husband before he woke up this morning.:)",
    created_at: DateTime.new(2014, 7, 21, 1, 1),
    updated_at: DateTime.new(2014, 7, 21, 1, 1)
  })
  Deed.find_or_create_by({
    person: 'Kate',
    action: 'I helped a blind person to go through a road',
    created_at: DateTime.new(2014, 7, 20, 13, 1),
    updated_at: DateTime.new(2014, 7, 20, 13, 1)
  })
ensure
  ActiveRecord::Base.record_timestamps = true
end
