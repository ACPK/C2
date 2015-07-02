module Ncr
  module WorkOrdersHelper
    def approver_options
      # @todo should this list be limited by client/something else?
      # @todo is there a better order? maybe by current_user's use?
      User.order(:email_address).pluck(:email_address)
    end

    def building_options
      custom = Ncr::WorkOrder.where.not(building_number: nil).pluck('DISTINCT building_number')
      all = custom + Ncr::BUILDING_NUMBERS
      # @todo is there a better order? maybe by current_user's use?
      all.uniq.sort
    end

    def vendor_options
      Ncr::WorkOrder.where.not(vendor: nil).pluck('DISTINCT vendor').sort
    end
  end
end
