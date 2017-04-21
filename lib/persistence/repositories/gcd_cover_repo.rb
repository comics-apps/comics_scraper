class GcdCoverRepo < ROM::Repository[:gcd_covers]
  commands :create

  def delete_by_issue_id(issue_id:)
    gcd_covers.where(issue_id: issue_id).delete
  end
end
