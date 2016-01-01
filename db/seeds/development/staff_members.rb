StaffMember.create!(
 email: 'toshi@example.com',
 family_name: '高橋',
 given_name: '利治',
 family_name_eng: 'Takahashi',
 given_name_eng: 'Toshiharu',
 staff_user_name: 'Haru',
 password: 'password',
 start_date: Date.today
)


family_names = %w{
   佐藤:sato
   鈴木:suzuki
   高橋:takahashi
   田中:tanaka
   김:kim
}

given_names = %w{
	二郎:jiro
	三郎:saburo
	松子:matsuko
	竹子:takeko
	梅子:umeko
	형성:hyongsong

}

20.times do |n|
	fn = family_names[n % 5].split(':')
	gn = given_names[n % 6].split(':')	

	StaffMember.create!(
        
        email: "#{fn[1]}.#{gn[1]}@example.com",
        family_name: fn[0],
        given_name: gn[0],
        family_name_eng: fn[1],
        given_name_eng: gn[1],
        staff_user_name: gn[1],
        password: 'password',
        start_date: (100 - n).days.ago.to_date,
        end_date: n == 0 ? Date.today : nil, 
        suspended: n == 1

		)
end
