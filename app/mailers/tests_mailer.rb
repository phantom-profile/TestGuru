class TestsMailer < ApplicationMailer
	def completed(test_passage)
		@user = test_passage.user
		@test = test_passage.test

		mail to: @user.email, subject: 'you completed test'
	end
end
