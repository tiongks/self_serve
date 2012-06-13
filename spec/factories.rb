# the symbol :user simulates the user model
Factory.define :user do |user|
	user.user_name								"test_user"
	user.first_name								"Test"
	user.last_name								"User"
	user.email										"test@user.com"
	user.pass_phrase							"letmethrough"
	user.pass_phrase_confirmation	"letmethrough"
end
