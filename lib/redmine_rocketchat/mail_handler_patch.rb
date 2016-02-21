require_dependency 'mail_handler'

module MailHandlerPatch
  def self.included(base) # :nodoc:
    base.send(:include, InstanceMethods)

    base.class_eval do
      alias_method_chain :receive_issue, :notification
      alias_method_chain :receive_issue_reply, :notification
    end
  end

  module InstanceMethods
    private

    def receive_issue_with_notification
      issue = receive_issue_without_notification
      Redmine::Hook.call_hook(:controller_issues_new_after_save, {:issue => issue})
      issue
    end

    def receive_issue_reply_with_notification(issue_id, from_journal=nil)
      journal = receive_issue_reply_without_notification(issue_id, from_journal)
      Redmine::Hook.call_hook(:controller_issues_edit_after_save, { :issue => journal.issue, :journal => journal})
      journal
    end

  end
end

MailHandler.send(:include, MailHandlerPatch)