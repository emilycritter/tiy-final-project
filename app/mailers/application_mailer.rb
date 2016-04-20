class ApplicationMailer < ActionMailer::Base
  default from: "from@where-art-thou.herokuapp.com"
  layout 'mailer'
end
