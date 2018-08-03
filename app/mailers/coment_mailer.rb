class ComentMailer < ApplicationMailer

  def coment_mail(coment)
    @coment = coment
    mail to: @coment.user.email, subject: "投稿内容確認メール"
  end
end
