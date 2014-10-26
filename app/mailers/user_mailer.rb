# The {UserMailer} handles compiling and sending emails to Users
# using the Mandrill API. All email is localized to the User's
# language.
#
# @note All email content, subject lines and the templates are
#       external to this API. Content & Subject is stored in
#       LocaleApp. Templates are stored directly in Mandrill.
class UserMailer < MandrillMailer::TemplateMailer

  default from: ENV['SMTP_RECIPIENT']
  default to: ENV['SMTP_RECIPIENT']

  def welcome(user)
    mandrill_mail options(user, 'welcome', 'Welcome to Hashtagg.tv')
  end

  private

  def options(user, name, subject, vars = {})
    attribs = attributes(user)
    {
      to: user.email,
      vars: attribs.merge(vars),
      inline_css: true,
      template: name,
      subject: subject,
      template_content: { body: I18n.t("mail.user.#{name}.content", attribs) }
    }
  end

  def attributes(user)
    JSON.parse(user.to_json)
  end

end