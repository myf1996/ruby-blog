module Visible
  extend ActiveSupport::Concern

  VALID_STATUSES = ['public', 'private', 'archived']

  included do
    validates :status, inclusion: { in: VALID_STATUSES }
  end

  class_methods do
    def public_count
      where(status: 'public').count
    end
  end

  class_methods do
    def private_count
      where(status: 'private').count
    end
  end

  class_methods do
    def archived_count
      where(status: 'archived').count
    end
  end

  def archived?
    status == 'archived'
  end
end

# VALID_STATUSES = ['public', 'private', 'archived']
#   validates :status, inclusion: { in: VALID_STATUSES }

#   def archived?
#     status == 'archived'
#   end