module RedmineBulkSubjectEdit
  class AccountListener < Redmine::Hook::ViewListener
    render_on :view_issues_bulk_edit_details_bottom, :partial => 'bulk_subject/issues_bulk_edit_details_bottom'

    # 題名に前置詞と後置詞を付与
    def controller_issues_bulk_edit_before_save(context = {})
      params = context[:params] && context[:params][:issue]
      issue = context[:issue]

      return if issue.nil? || params.blank?

      issue.subject = "#{params[:subject_prefix]}#{issue.subject}#{params[:subject_suffix]}"
    end
  end
end
