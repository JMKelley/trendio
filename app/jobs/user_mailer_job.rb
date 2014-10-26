# The {UserMailerJob} responds to delayed requests to send
# Users emails. This job is necessary, as we use Mandrill
# as the engine to send emails, which does not support
# the #.delay() syntax.
class UserMailerJob < Struct.new(:action, :user_id)

  # Perform the job. This is the main entry point that
  # a Delayed Job Worker will call.
  #
  # @return nil
  def perform
    UserMailer.send(action.to_sym, User.find(user_id)).deliver
  end

end