module Gsa18f
  class ProcurementsController < ClientDataController

    protected

    def model_class
      Gsa18f::Procurement
    end

    def permitted_params
      Gsa18f::Procurement.permitted_params(params, @client_data_instance)
    end

    def add_steps
      super
      if errors.empty?
        @client_data_instance.add_steps
      end
    end
  end
end
