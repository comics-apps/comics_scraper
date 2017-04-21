class GcdCoverRepo < ROM::Repository[:gcd_covers]
  commands :create

  def find(id:)
    gcd_covers.where(id: id).first
  end

  def delete_by_issue_id(issue_id:)
    gcd_covers.where(issue_id: issue_id).delete
  end
end
