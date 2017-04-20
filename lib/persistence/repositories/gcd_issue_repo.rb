class GcdIssueRepo < ROM::Repository[:gcd_issue]
  def count
    gcd_issue.count
  end

  def find_each(offset:, limit:)
    gcd_issue.offset(offset).limit(limit).to_a
  end
end
