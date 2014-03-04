module HealthDataStandards
  module Export
    module Helper
      module HTMLViewHelper
        include HealthDataStandards::Export::Helper::ScoopedViewHelper

        def decode_hqmf_section(section, oid)
          if oid
            HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)['definition'].pluralize.to_sym
          else
            section
          end
        end

        def decode_hqmf_status(status, oid)
          if oid
            HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)['status']
          else
            status
          end
        end

        def decode_hqmf_description(description, oid)
          if oid
            definition = HealthDataStandards::Util::HQMFTemplateHelper.definition_for_template_id(oid)
            "#{definition['definition'].titleize}, #{definition['status'].titleize}".to_sym
          else
            description
          end
        end
      end
    end
  end
end