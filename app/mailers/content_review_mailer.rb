class ContentReviewMailer < ActionMailer::Base
  default :from => "christopher.nash@ama.ab.ca"
  
  def review_email(editor)
    @pages = editor.pages.find_all_by_next_review_date(Date.parse(Date.today.to_s))
    mail(:to => editor.email, 
          :subject => "Today's content pages to be reviewed")
    end
end
